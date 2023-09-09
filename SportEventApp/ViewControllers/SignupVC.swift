//
//  SecondVC.swift
//  SportEventApp
//
//  Created by Dima Kahanets on 30.08.2023.
//

import Foundation
import UIKit

class SignupVC: UIViewController {
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = false
        
        let nameImage = UIImage(named: "user")
        addLeftImage(textField: nameTF, image: nameImage!)
        
        let emailImage = UIImage(named: "envelope")
        addLeftImage(textField: emailTF, image: emailImage!)
        
        let passwordImage = UIImage(named: "lock")
        addLeftImage(textField: passwordTF, image: passwordImage!)
        
        self.dismissKeyboard()
        
        nameTF.configureTF()
        emailTF.configureTF()
        passwordTF.configureTF()
    }
    
    func addLeftImage(textField: UITextField, image: UIImage) {
        let padding = 16
        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: image.size.width + CGFloat(padding), height: image.size.height) )
        let leftImageView = UIImageView(frame: CGRect(x: CGFloat(padding), y: 0.0, width: image.size.width, height: image.size.height))
        leftImageView.image = image
        outerView.addSubview(leftImageView)
        textField.leftView = outerView
        textField.leftViewMode = .always
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
