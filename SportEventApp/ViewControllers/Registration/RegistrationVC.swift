//
//  SignUpVC.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 04.09.2023.
//

import Foundation
import UIKit
import RealmSwift
import CoreData

class RegistrationVC: UIViewController {

    var textStackView = UIStackView()
    let fullnameTF = UITextField()
    let emailTF = UITextField()
    let passwordTF = UITextField()
    let context = CoreDataService().persistentContainer.viewContext
    var regDelegate = [RegistrationCoreData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        //initializing
        passwordTF.isSecureTextEntry = true
        let backgroungUIView = UIImageView(image: UIImage(named: "SignUpBG"))
        view.addSubview(backgroungUIView)
        backgroungUIView.isUserInteractionEnabled = true
        
        let formView = UIView()
        formView.layer.cornerRadius = 16
        formView.backgroundColor = UIColor(red: 0, green: 0.14, blue: 0.25, alpha: 1)
        backgroungUIView.addSubview(formView)
        formView.isUserInteractionEnabled = true
        
        let signUpTitle = UILabel()
        signUpTitle.text = "Sign Up"
        signUpTitle.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        signUpTitle.textColor = .white
        formView.addSubview(signUpTitle)
        
        let textFieldCellArray: [(UIImage, String, UITextContentType, UITextField)] = [
            (UIImage(named: "personImage") ?? UIImage(), "Full name", .name, fullnameTF),
            (UIImage(named: "emailImage") ?? UIImage(), "Email or username", .emailAddress, emailTF),
            (UIImage(named: "passwordImage") ?? UIImage(), "Password", .password, passwordTF)
        ]
        
        textStackView = UIStackView(arrangedSubviews: textFieldCellArray.map( { item in
            
            let textField = item.3
            //mainview setup
            textField.layer.borderColor = UIColor.gray.cgColor
            textField.layer.borderWidth = 2
            textField.layer.cornerRadius = 10
            textField.isUserInteractionEnabled = true
            textField.autocapitalizationType = .none
            
            let mainViewPadding = UIView.init(frame: CGRect(x: 0, y: 0, width: 30, height: 0))
            textField.leftView = mainViewPadding
            textField.leftViewMode = .always
            //image setup
            
            let leftImageView = UIImageView(frame: CGRect(x: 6, y: -10, width: item.0.size.width, height: item.0.size.height))
            leftImageView.image = item.0
            textField.leftView = mainViewPadding
            textField.leftViewMode = .always
            textField.textColor = .white
            textField.isUserInteractionEnabled = true
            
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
            
            let attributedPlaceholder = NSAttributedString(string: item.1, attributes: attributes)
            
            textField.attributedPlaceholder = attributedPlaceholder
            
            textField.snp.makeConstraints {
                $0.height.equalTo(50)
            }
            return textField
        }))
        textStackView.spacing = 8
        textStackView.axis = .vertical
        textStackView.isUserInteractionEnabled = true
        formView.addSubview(textStackView)
        
        let signInBtn = UIButton()
        signInBtn.setTitle("Sign in", for: .normal)
        signInBtn.setTitleColor(.white, for: .normal)
        signInBtn.backgroundColor = UIColor(red: 0, green: 0.42, blue: 1, alpha: 1)
        signInBtn.layer.cornerRadius = 16
        signInBtn.isUserInteractionEnabled = true
        signInBtn.addTarget(self, action: #selector(pushToMain), for: .touchUpInside)
        formView.addSubview(signInBtn)
        
        let createAccSV = UIStackView()
        createAccSV.isUserInteractionEnabled = true
        formView.addSubview(createAccSV)
        
        let createAccLabel = UILabel()
        createAccLabel.text = "Do you already have an account?"
        createAccLabel.textColor = .systemGray6
        
        let signInExistAccBtn = UIButton()
        signInExistAccBtn.setTitle("Sign In", for: .normal)
        signInExistAccBtn.setTitleColor(.systemBlue, for: .normal)
        signInExistAccBtn.addTarget(self, action: #selector(pushToSignInVC), for: .touchUpInside)
        signInExistAccBtn.isUserInteractionEnabled = true
        createAccSV.addArrangedSubview(createAccLabel)
        createAccSV.addArrangedSubview(signInExistAccBtn)
        createAccSV.spacing = 8
        
        let backBtn = UIButton()
        backBtn.setImage(UIImage(named: "blackBack"), for: .normal)
        backBtn.addTarget(self, action: #selector(back) , for: .touchUpInside)
        view.addSubview(backBtn)
        //constraints
        
        backgroungUIView.snp.makeConstraints {
            $0.top.left.right.bottom.equalToSuperview()
        }
        
        formView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(316)
            $0.left.right.equalToSuperview()
            $0.bottom.equalToSuperview().inset(-30)
        }
        
        signUpTitle.snp.makeConstraints {
            $0.top.equalTo(formView).inset(16)
            $0.left.equalToSuperview().inset(24)
        }
        
        textStackView.snp.makeConstraints {
            $0.top.equalTo(signUpTitle).inset(64)
            $0.left.right.equalToSuperview().inset(16)
        }
        
        signInBtn.snp.makeConstraints {
            $0.top.equalTo(textStackView.snp.bottom).inset(-16)
            $0.centerX.equalTo(formView.snp.centerX)
            $0.left.right.equalTo(formView).inset(24)
            $0.height.equalTo(50)
        }
        
        createAccSV.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(48)
            $0.centerX.equalTo(formView.snp.centerX)
        }
        
        backBtn.snp.makeConstraints {
            $0.left.equalTo(view).inset(8)
            $0.top.equalTo(view).inset(32)
        }
    }
    @objc func pushToMain() {
        createUser()
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SignInTable") as! MainVC
        self.navigationController?.pushViewController(nextViewController, animated: true)
        
        let fetchRequest: NSFetchRequest<RegistrationCoreData> = RegistrationCoreData.fetchRequest()
        do {
            let users = try context.fetch(fetchRequest)
            for user in users {
                print("Email: \(user.email ?? "Unknown email")")
                print("Password: \(user.password ?? "No Password")")
               
                print("--------------------------------")
            }
        } catch {
            print("Ошибка при загрузке данных: \(error)")
        }
        print(try! context.count(for: fetchRequest))
        
    }
    
    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func pushToSignInVC() {
        navigationController?.pushViewController(LoginVC(), animated: true)
    }
}

extension RegistrationVC {
    func getAllUsers() {
        do {
            regDelegate = try context.fetch(RegistrationCoreData.fetchRequest())
            print("Loaded \(regDelegate.count) items")
        } catch {}
    }
    
    func createUser() {
        let item = RegistrationCoreData(context: context)
        item.id = UUID()
        item.email = emailTF.text
        item.password = passwordTF.text
        
        do {
            try context.save()
        } catch {}
        getAllUsers()
        regDelegate.append(item)
    }
}
