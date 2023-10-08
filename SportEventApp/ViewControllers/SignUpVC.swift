//
//  SignUpVC.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 02.09.2023.
//

import Foundation
import UIKit
import RealmSwift

class SignUpVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var fullNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullNameTF.delegate = self
        emailTF.delegate = self
        passwordTF.delegate = self
        self.dismissKeyboard()
        navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func tapLogIn(_ sender: UIButton) {
        let vc = SignInVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tapSignUp(_ sender: UIButton) {
        let login = fullNameTF.text ?? ""
        let email = emailTF.text ?? ""
        let password = passwordTF.text ?? ""
        let checkEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailChecker = NSPredicate(format: "SELF MATCHES %@", checkEmail)
        
        guard !login.isEmpty, !email.isEmpty, !password.isEmpty else {
            showAlert(title: "Oops!", message: "Fill in all fields!")
            return
        }
        
        guard emailChecker.evaluate(with: email) else {
            showAlert(title: "Oops!", message: "Enter correct email!")
            return
        }
        
        addUser(login: login, email: email, password: password)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension SignUpVC {
    
    private func dismissKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:    #selector(SignUpVC.dismissKeyboardTouchOutside))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboardTouchOutside() {
        view.endEditing(true)
    }
}

extension SignUpVC {
    
    private func addUser(login: String, email: String, password: String) {
        let realm = try! Realm()
        let allObj = realm.objects(User.self)
        let user = User(login: login, email: email, password: password)
        
        if allObj.filter({ $0.email == user.email || $0.login == login}).isEmpty {
            try! realm.write {
                realm.add(user)
                showAlert(title: "Congratulations!", message: "You have successfully registered!")
            }
        } else {
            showAlert(title: "Oops!", message: "User with this email already exists")
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
