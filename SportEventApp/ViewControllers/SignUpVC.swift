//
//  SignUpVC.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 04.09.2023.
//

import Foundation
import UIKit
import RealmSwift

class SignUpVC: UIViewController {
    
    @IBOutlet weak var fullnameTextView: UITextField!
    @IBOutlet weak var emailTextView: UITextField!
    @IBOutlet weak var passwordTextView: UITextField!
    @IBOutlet weak var textStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldSettings(fullnameTextView, UIImage(named: "personImage")!, placeholderText: "Full Name")
        textFieldSettings(emailTextView, UIImage(named: "emailImage")!, placeholderText: "E-mail")
        textFieldSettings(passwordTextView, UIImage(named: "passwordImage")!, placeholderText: "Password")
    }
    
    @IBAction func fullNameSettings(_ textField: UITextField) {
         }
     
    @IBAction func signUpBtnFunc(_ sender: UIButton) {
        print(fullnameTextView.text as Any)
    }
    
    
    func textFieldSettings(_ textField: UITextField, _ image: UIImage, placeholderText: String) {
       //mainview setup
        textField.layer.borderColor = UIColor.gray.cgColor
        let mainViewPadding = UIView.init(frame: CGRect(x: 0, y: 0, width: 30, height: 0))
        textField.leftView = mainViewPadding
        textField.leftViewMode = .always
        //image setup
        
        let leftImageView = UIImageView(frame: CGRect(x: 8, y: -9, width: image.size.width, height: image.size.height))
        leftImageView.image = image
        textField.leftView = mainViewPadding
        textField.leftViewMode = .always
        mainViewPadding.addSubview(leftImageView)
        //placeholder setup
        let padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
             let paragraphStyle = NSMutableParagraphStyle()
             paragraphStyle.alignment = .left
             paragraphStyle.firstLineHeadIndent = padding.left
             let attributes: [NSAttributedString.Key: Any] = [
                 .font: UIFont.systemFont(ofSize: 16),
                 .foregroundColor: UIColor.gray,
                 .paragraphStyle: paragraphStyle
             ]

             let attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)

        textField.attributedPlaceholder = attributedPlaceholder
    }
}

extension SignUpVC {
    func setupRealm() {
        let realm = try! Realm()
        let settings = RealmSettings()
        
        do {
            try realm.write {
                settings.fullname = fullnameTextView.text ?? ""
                settings.email = emailTextView.text ?? ""
                settings.password = passwordTextView.text ?? ""
            }
        } catch {
            fatalError("ERROR")
        }
    }
}
class RealmSettings: Object {
    @Persisted dynamic var id = UUID().uuidString
    @Persisted dynamic var fullname = ""
    @Persisted dynamic var email = ""
    @Persisted dynamic var password = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
