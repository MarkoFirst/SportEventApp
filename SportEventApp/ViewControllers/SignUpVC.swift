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
    
    @IBOutlet weak var fullnameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var textStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldSettings(fullnameTF, UIImage(named: "personImage")!, placeholderText: "Full Name")
        textFieldSettings(emailTF, UIImage(named: "emailImage")!, placeholderText: "E-mail")
        textFieldSettings(passwordTF, UIImage(named: "passwordImage")!, placeholderText: "Password")
    }

    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func signUpBtnFunc(_ sender: UIButton) {
        setupRealm()
    }
    
    func textFieldSettings(_ textField: UITextField, _ image: UIImage, placeholderText: String) {
       //mainview setup
        passwordTF.isSecureTextEntry = true
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
        
        do {
            try realm.write {
                let settings = RealmSettings()
                settings.id = UUID().uuidString
                settings.fullname = fullnameTF.text?.description ?? ""
                settings.email = emailTF.text?.description ?? ""
                settings.password = passwordTF.text?.description ?? ""
                realm.add(settings)
            }
            
        } catch {
            fatalError("ERROR")
        }
        let objects = realm.objects(RealmSettings.self)
        print(objects)
    }
}
class RealmSettings: Object {
    @Persisted dynamic var id = UUID().uuidString
    @Persisted dynamic var fullname: String
    @Persisted dynamic var email: String
    @Persisted dynamic var password: String
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
