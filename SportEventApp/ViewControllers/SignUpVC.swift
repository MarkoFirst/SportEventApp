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
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
