//
//  LoginVC.swift
//  SportEventApp
//
//  Created by Dima Kahanets on 11.09.2023.
//

import Foundation
import UIKit
import SnapKit

class LoginVC: UIViewController {
    
    private var formStack: UIStackView!
    private var emailTF: CustomTF!
    private var passwordTF: CustomTF!
    
    let service = CoreDataService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        dismissKeyboard()
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Got it", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func loginToAccount() {
        let email = emailTF.getText() ?? ""
        let password = passwordTF.getText() ?? ""
        
        // MARK: Getting users from Core Data
        
        let users = service.getUser()
        
        // MARK: Checking for user availability in Core Data
        
        let userExists = users.contains { user in
            user.email == email &&
            user.password == password
        }
        
        // MARK: Output of the corresponding alert
        
        if userExists {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "homeID") as! HomeVC
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            showAlert(title: "Error", message: "This user not exists in Core Data.")
        }
    }
}

extension LoginVC {
    
    func setupView() {
        
        // MARK: Configure views
        
        let backImage = UIImageView(image: UIImage(named: "target"))
        backImage.contentMode = .scaleAspectFill
        
        let formView = UIView()
        formView.backgroundColor = .white
        formView.layer.cornerRadius = 20
        formView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        formView.layer.cornerCurve = .continuous
        
        let titleLabel = UILabel()
        titleLabel.text = "Welcome back!"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        
        let loginButton = UIButton(type: .system)
        loginButton.setTitle("Log in", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 12
        loginButton.layer.cornerCurve = .continuous
        loginButton.clipsToBounds = true
        loginButton.backgroundColor = UIColor(red: 0.239, green: 0.357, blue: 0.949, alpha: 1)
        loginButton.addTarget(self, action: #selector(loginToAccount), for: .touchUpInside)
        
        let forgotPassButton = UIButton(type: .system)
        forgotPassButton.setTitle("Forgot password?", for: .normal)
        forgotPassButton.setTitleColor(UIColor(red: 0.238, green: 0.356, blue: 0.95, alpha: 1), for: .normal)
        forgotPassButton.backgroundColor = .clear
        
        guard let emailImage = UIImage(named: "envelope"),
              let passwordImage = UIImage(named: "lock")
        else {
            return
        }
        
        emailTF = CustomTF()
        emailTF.configure(image: emailImage, placeholder: "Email address", textContentType: .emailAddress, keyboardType: .emailAddress, isSecureTextEntry: false)
        
        passwordTF = CustomTF()
        passwordTF.configure(image: passwordImage, placeholder: "Password", textContentType: .password, keyboardType: .default, isSecureTextEntry: true)
        
        formStack = UIStackView(arrangedSubviews: [emailTF, passwordTF])
        formStack.axis = .vertical
        formStack.spacing = 16
        
        let questionLabel = UILabel()
        questionLabel.text = "Don't have an account?"
        questionLabel.textColor = .black
        questionLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        
        let signupButton = UIButton()
        signupButton.setTitle("Sign up", for: .normal)
        signupButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
        signupButton.setTitleColor(UIColor(red: 0.238, green: 0.356, blue: 0.95, alpha: 1), for: .normal)
        signupButton.backgroundColor = .clear
        
        let hStackView = UIStackView(arrangedSubviews: [questionLabel, signupButton])
        hStackView.axis = .horizontal
        hStackView.alignment = .center
        hStackView.distribution = .fillProportionally
        hStackView.spacing = 4
        
        // MARK: Adding views
        
        view.addSubview(backImage)
        view.addSubview(formView)
        
        formView.addSubview(titleLabel)
        formView.addSubview(loginButton)
        formView.addSubview(forgotPassButton)
        formView.addSubview(formStack)
        formView.addSubview(hStackView)
        
        // MARK: Setup constraints
        
        backImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(220)
        }
        
        formView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.top.equalTo(backImage.snp.bottom).offset(-20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(24)
        }
        
        forgotPassButton.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.top.equalTo(formStack.snp.bottom).offset(24)
            make.trailing.equalTo(formView).offset(-24)
        }
        
        loginButton.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.top.equalTo(forgotPassButton.snp.bottom).offset(24)
            make.leading.trailing.equalTo(formView).inset(24)
        }
        
        formStack.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.leading.trailing.equalTo(formView).inset(24)
        }
        
        hStackView.snp.makeConstraints { make in
            make.bottom.equalTo(formView.safeAreaLayoutGuide.snp.bottom).offset(-24)
            make.centerX.equalTo(formView.snp.centerX)
        }
    }
}
