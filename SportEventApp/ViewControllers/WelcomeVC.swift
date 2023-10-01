//
//  WelcomeVC.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 14.09.2023.
//

import Foundation
import SnapKit
import UIKit

class WelcomeVC: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //initializing
        let backgroungUIView = UIImageView(image: UIImage(named: "SignUpBG"))
        view.addSubview(backgroungUIView)
        backgroungUIView.isUserInteractionEnabled = true
        
        let formView = UIView()
        formView.layer.cornerRadius = 16
        formView.backgroundColor = UIColor(red: 0, green: 0.14, blue: 0.25, alpha: 1)
        backgroungUIView.addSubview(formView)
        formView.isUserInteractionEnabled = true
        formView.isUserInteractionEnabled = true

        
        let welcomeTitle = UILabel()
        welcomeTitle.text = "Welcome"
        welcomeTitle.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        welcomeTitle.textColor = .white
        formView.addSubview(welcomeTitle)
        
        let textFieldCellArray: [(UIImage, String, UITextContentType)] = [
            (UIImage(named: "emailImage") ?? UIImage(), "Email or username", .emailAddress),
            (UIImage(named: "passwordImage") ?? UIImage(), "Password", .password)
        ]
        
        
        let stackView = UIStackView(arrangedSubviews: textFieldCellArray.map( { item in
            
            let textField = UITextField()
            //mainview setup
            textField.layer.borderColor = UIColor.gray.cgColor
            textField.layer.borderWidth = 2
            textField.layer.cornerRadius = 10
            textField.isUserInteractionEnabled = true

            
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
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.isUserInteractionEnabled = true
        formView.addSubview(stackView)
        
        let forgotPassBtn = UIButton()
        forgotPassBtn.setTitle("Forgot password?", for: .normal)
        forgotPassBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        forgotPassBtn.setTitleColor(UIColor(red: 0, green: 0.42, blue: 1, alpha: 1), for: .normal)
        forgotPassBtn.isUserInteractionEnabled = true
        formView.addSubview(forgotPassBtn)
        
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
        createAccLabel.text = "Don't have an account?"
        createAccLabel.textColor = .systemGray6
        
        let createAccBtn = UIButton()
        createAccBtn.setTitle("Sign up", for: .normal)
        createAccBtn.setTitleColor(.systemBlue, for: .normal)
        createAccBtn.isUserInteractionEnabled = true
        createAccSV.addArrangedSubview(createAccLabel)
        createAccSV.addArrangedSubview(createAccBtn)
        createAccSV.spacing = 8
        
        //constraints
        
        backgroungUIView.snp.makeConstraints {
            $0.top.left.right.bottom.equalToSuperview()
        }
        
        formView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(316)
            $0.left.right.equalToSuperview()
            $0.bottom.equalToSuperview().inset(-30)
        }
        
        welcomeTitle.snp.makeConstraints {
            $0.top.equalTo(formView).inset(16)
            $0.left.equalToSuperview().inset(24)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(welcomeTitle).inset(64)
            $0.left.right.equalToSuperview().inset(16)
        }
        
        
        
        forgotPassBtn.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).inset(-8)
            $0.right.equalTo(formView).inset(32)
        }
        
        signInBtn.snp.makeConstraints {
            $0.top.equalTo(forgotPassBtn.snp.bottom).inset(-16)
            $0.centerX.equalTo(formView.snp.centerX)
            $0.left.right.equalTo(formView).inset(24)
            $0.height.equalTo(50)
        }
        
        createAccSV.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(48)
            $0.centerX.equalTo(formView.snp.centerX)
        }
        
    }
    @objc func pushToMain(sender: UIButton!) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SignInTable") as! SignInVC
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

