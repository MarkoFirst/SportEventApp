//
//  SecondVC.swift
//  SportEventApp
//
//  Created by Dima Kahanets on 30.08.2023.
//

import Foundation
import RealmSwift
import UIKit

class SignupVC: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var signUp: UIButton!
    
    // Open the local-only default realm
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUp.addTarget(self, action: #selector(createNewUser), for: .touchUpInside)
        
        setupTextFields()
        
        dismissKeyboard()
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Got it", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func createNewUser() {
        let firstName = nameTF.text ?? ""
        let email = emailTF.text ?? ""
        let password = passwordTF.text ?? ""
        
        // MARK: Email format check
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        if !emailPredicate.evaluate(with: email) {
            showAlert(title: "Error", message: "Invalid email format. Please use a valid email address.")
            return
        }
        
        // MARK: Get all users in the realm
    
        let users = realm.objects(User.self)

        // MARK: Checking for user availability in Realm
        
        let userExists = users.contains { user in
            user.firstName == firstName &&
            user.email == email &&
            user.password == password
        }
        
        // MARK: Output of the corresponding alert
        
        if userExists {
            showAlert(title: "Error", message: "This user already exists in Realm.")
        } else {
            
            let user = User(firstName: firstName, email: email, password: password)
            do {
                try realm.write {
                    realm.add(user)
                }
                showAlert(title: "Success", message: "New user successfully added to Realm.")
            } catch {
                print("Error: \(error)")
            }
        }
    }
}


extension SignupVC {
    func setupTextFields() {
        guard let nameImage = UIImage(named: "user"),
              let emailImage = UIImage(named: "envelope"),
              let passwordImage = UIImage(named: "lock")
        else {
            return
        }
        
        addLeftImage(textField: nameTF, image: nameImage)
        addLeftImage(textField: emailTF, image: emailImage)
        addLeftImage(textField: passwordTF, image: passwordImage)
        
        nameTF.configureTF()
        emailTF.configureTF()
        passwordTF.configureTF()
    }
    
    func addLeftImage(textField: UITextField, image: UIImage) {
        let padding = 16
        let boundingView = UIView(frame: CGRect(x: 0, y: 0, width: image.size.width + CGFloat(padding), height: image.size.height) )
        let imageView = UIImageView(frame: CGRect(x: CGFloat(padding), y: 0.0, width: image.size.width, height: image.size.height))
        imageView.image = image
        boundingView.addSubview(imageView)
        textField.leftView = boundingView
        textField.leftViewMode = .always
    }
}

extension UIViewController {
    func dismissKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action:    #selector(UIViewController.dismissKeyboardTouchOutside))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboardTouchOutside() {
        view.endEditing(true)
    }
}

extension UITextField {
    func configureTF() {
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 0.902, green: 0.902, blue: 0.902, alpha: 1).cgColor
        layer.cornerRadius = 10
        clipsToBounds = true
    }
}
