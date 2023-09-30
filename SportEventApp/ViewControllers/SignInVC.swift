//
//  SignInVC.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 17.09.2023.
//

import Foundation
import SnapKit
import UIKit

class SignInVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.dismissKeyboard()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

extension SignInVC: UITextFieldDelegate {
    
    func setupView() {
        
        view.backgroundColor = UIColor(red: 0.039, green: 0.145, blue: 0.251, alpha: 1)
        
        let topImage = UIImageView(image: UIImage(named: "SignUpAthletes"))
        view.addSubview(topImage)
        
        let mainView = UIView()
        mainView.layer.cornerRadius = 25
        mainView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        mainView.backgroundColor = UIColor(red: 0.039, green: 0.145, blue: 0.251, alpha: 1)
        view.addSubview(mainView)
        
        let mainLabel = UILabel()
        mainLabel.text = "Welcome"
        mainLabel.font = UIFont(name: "Helvetica", size: 32)
        mainLabel.textColor = UIColor(red: 0.95, green: 1, blue: 1, alpha: 1)
        view.addSubview(mainLabel)
        
        let mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.spacing = 20
        view.addSubview(mainStackView)
        
        let userNameView = UIView()
        userNameView.layer.cornerRadius = 10
        userNameView.layer.borderWidth = 1
        userNameView.layer.borderColor = UIColor(red: 0.424, green: 0.537, blue: 0.651, alpha: 1).cgColor
        mainStackView.addArrangedSubview(userNameView)
        
        let userNameImage = UIImageView(image: UIImage(named: "mailLogo"))
        userNameView.addSubview(userNameImage)
        
        let userNameTextField = UITextField()
        userNameTextField.placeholder = "Email or username"
        userNameTextField.textContentType = .username
        userNameTextField.textColor = UIColor(red: 0.761, green: 0.761, blue: 0.761, alpha: 1)
        userNameTextField.delegate = self
        userNameView.addSubview(userNameTextField)
        
        let userPasswordView = UIView()
        userPasswordView.layer.cornerRadius = 10
        userPasswordView.layer.borderWidth = 1
        userPasswordView.layer.borderColor = UIColor(red: 0.424, green: 0.537, blue: 0.651, alpha: 1).cgColor
        mainStackView.addArrangedSubview(userPasswordView)
        
        let userPasswordImage = UIImageView(image: UIImage(named: "passwordLogo"))
        userPasswordView.addSubview(userPasswordImage)
        
        let userPasswordInvisibleImage = UIImageView(image: UIImage(named: "invisibleLogo"))
        userPasswordView.addSubview(userPasswordInvisibleImage)
        
        let userPasswordTextField = UITextField()
        userPasswordTextField.placeholder = "Password"
        userPasswordTextField.textContentType = .password
        userPasswordTextField.isSecureTextEntry = true
        userPasswordTextField.textColor = UIColor(red: 0.761, green: 0.761, blue: 0.761, alpha: 1)
        userPasswordTextField.delegate = self
        userPasswordView.addSubview(userPasswordTextField)
        
        let userForgotBtnView = UIView()
        mainStackView.addArrangedSubview(userForgotBtnView)
        
        let forgotButton = UIButton(type: .system)
        forgotButton.setTitle("Forgot password?", for: .normal)
        forgotButton.tintColor = UIColor(red: 0.184, green: 0.486, blue: 0.965, alpha: 1)
        forgotButton.titleLabel?.font = UIFont(name: "Helvetica", size: 16)
        userForgotBtnView.addSubview(forgotButton)
        
        let signInButton = UIButton(type: .system)
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.tintColor = UIColor(red: 0.973, green: 0.98, blue: 1, alpha: 1)
        signInButton.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
        signInButton.backgroundColor = UIColor(red: 0.184, green: 0.486, blue: 0.965, alpha: 1)
        signInButton.layer.cornerRadius = 10
        signInButton.addTarget(self, action: #selector(tapSignIn), for: .touchUpInside)
        mainStackView.addArrangedSubview(signInButton)
        
        let signUpStackView = UIStackView()
        signUpStackView.axis = .horizontal
        signUpStackView.spacing = 8
        view.addSubview(signUpStackView)
        
        let signUpLabel = UILabel()
        signUpLabel.text = "Don`t have an account?"
        signUpLabel.font = UIFont(name: "Helvetica", size: 16)
        signUpLabel.textColor = UIColor(red: 0.388, green: 0.506, blue: 0.62, alpha: 1)
        signUpStackView.addArrangedSubview(signUpLabel)
        
        let signUpBtn = UIButton(type: .system)
        signUpBtn.setTitle("Sign Up", for: .normal)
        signUpBtn.tintColor = UIColor(red: 0.184, green: 0.486, blue: 0.965, alpha: 1)
        signUpBtn.titleLabel?.font = UIFont(name: "Helvetica", size: 16)
        signUpBtn.addTarget(self, action: #selector(tapSignUp), for: .touchUpInside)
        signUpStackView.addArrangedSubview(signUpBtn)
        
        topImage.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(topImage.snp.width).multipliedBy(343.0/414.0)
        }
        
        mainView.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.top).inset(-52)
            $0.bottom.leading.trailing.equalToSuperview()
        }
        
        mainLabel.snp.makeConstraints {
            $0.top.lessThanOrEqualTo(view.safeAreaLayoutGuide.snp.bottom).inset(-840)
            $0.leading.trailing.equalToSuperview().inset(36)
        }
        
        mainStackView.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).inset(-40)
            $0.leading.trailing.equalToSuperview().inset(36)
            $0.bottom.equalTo(signUpStackView.snp.top).inset(-124)
        }
        
        userNameView.snp.makeConstraints { $0.height.equalTo(60) }
        
        userNameImage.snp.makeConstraints {
            $0.height.width.equalTo(20)
            $0.leading.equalToSuperview().inset(8)
            $0.centerY.equalTo(userNameView.snp.centerY)
        }
        
        userNameTextField.snp.makeConstraints {
            $0.centerY.equalTo(userNameView.snp.centerY)
            $0.leading.equalTo(userNameImage.snp.trailing).inset(-16)
            $0.trailing.equalTo(userNameView.snp.trailing)
        }
        
        userPasswordView.snp.makeConstraints { $0.height.equalTo(60) }
        
        userPasswordImage.snp.makeConstraints {
            $0.height.width.equalTo(20)
            $0.leading.equalToSuperview().inset(8)
            $0.centerY.equalTo(userPasswordView.snp.centerY)
        }
        
        userPasswordInvisibleImage.snp.makeConstraints {
            $0.height.width.equalTo(20)
            $0.trailing.equalToSuperview().inset(8)
            $0.centerY.equalTo(userPasswordView.snp.centerY)
        }
        
        userPasswordTextField.snp.makeConstraints {
            $0.centerY.equalTo(userPasswordView.snp.centerY)
            $0.leading.equalTo(userPasswordImage.snp.trailing).inset(-16)
            $0.trailing.equalTo(userPasswordInvisibleImage.snp.leading).inset(-8)
        }
        
        userForgotBtnView.snp.makeConstraints { $0.height.equalTo(28) }
        
        forgotButton.snp.makeConstraints {
            $0.width.equalTo(150)
            $0.trailing.equalToSuperview()
        }
        
        signInButton.snp.makeConstraints {
            $0.height.equalTo(48)
            $0.leading.trailing.equalToSuperview()
        }
        
        signUpStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(24)
        }
    }
    
    func dismissKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:    #selector(SignInVC.dismissKeyboardTouchOutside))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboardTouchOutside() {
        view.endEditing(true)
    }
    
    @objc private func tapSignIn() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainStoryboard") as! MainTableVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func tapSignUp() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "signUpStoryboard") as! SignUpVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
