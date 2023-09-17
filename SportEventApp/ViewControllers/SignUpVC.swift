//
//  SignUpVC.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 02.09.2023.
//

import Foundation
import UIKit

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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension SignUpVC {
    func dismissKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:    #selector(SignUpVC.dismissKeyboardTouchOutside))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboardTouchOutside() {
        view.endEditing(true)
    }
}
