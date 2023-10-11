//
//  WelcomeVC.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 14.09.2023.
//

import Foundation
import SnapKit
import UIKit
import RealmSwift

class WelcomeVC: UIViewController {
    var stackView = UIStackView()
    let signUp = SignUpVC()
    private let enteredEmail = UITextField()
    private let enteredPassword = UITextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

    private func setupLayout() {
        //initializing
        enteredPassword.isSecureTextEntry = true
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

        let textFieldCellArray: [(UIImage, String, UITextContentType, UITextField)] = [
            (UIImage(named: "emailImage") ?? UIImage(), "Email or username", .emailAddress, enteredEmail),
            (UIImage(named: "passwordImage") ?? UIImage(), "Password", .password, enteredPassword)
        ]

            stackView = UIStackView(arrangedSubviews: textFieldCellArray.map( { item in

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

        backBtn.snp.makeConstraints {
            $0.left.equalTo(view).inset(8)
            $0.top.equalTo(view).inset(32)
        }
    }
    @objc func pushToMain(sender: UIButton!) {
        realm()
    }
    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
    
    private func realm() {
        let realm = try! Realm()
        let a = realm.objects(RealmSettings.self)

        switch (enteredEmail.text?.lowercased() ?? "", enteredPassword.text ?? "") {
        case let (enteredEmail, enteredPassword):
            if let user = a.first(where: { $0.email.lowercased() == enteredEmail.lowercased() && $0.password == enteredPassword }) {
                // Пользователь с такой почтой и паролем существует
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SignInTable") as! SignInVC
                self.navigationController?.pushViewController(nextViewController, animated: true)
            } else if a.contains(where: { $0.email.lowercased() == enteredEmail.lowercased() }) {
                // Пользователь с такой почтой существует, но пароль неверен
                let alert = UIAlertController(title: "Oops!", message: "Incorrect password!", preferredStyle: .actionSheet)
                let action = UIAlertAction(title: "Cancel", style: .cancel)
                alert.addAction(action)
                present(alert, animated: true)
            } else {
                // Пользователь с такой почтой не найден
                let alert = UIAlertController(title: "Oops!", message: "There is no such user!", preferredStyle: .actionSheet)
                let action = UIAlertAction(title: "Cancel", style: .cancel)
                alert.addAction(action)
                present(alert, animated: true)
            }
        default:
            // Не введена почта или пароль
            let alert = UIAlertController(title: "Oops!", message: "Please enter your email and password!", preferredStyle: .actionSheet)
            let action = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(action)
            present(alert, animated: true)
        }
    }
}
