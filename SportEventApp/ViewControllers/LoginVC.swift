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
    
    var vStackView: UIStackView!
    
    let textFields: [(UIImage, String, UITextContentType, UIKeyboardType)] = [
        (UIImage(named: "envelope")!, "Email or username", .emailAddress, .emailAddress),
        (UIImage(named: "lock")!, "Password", .password, .default)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        dismissKeyboard()
    }
    
    @objc func goToHomeVC() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "homeID") as! HomeVC
        self.navigationController?.pushViewController(nextViewController, animated: true)
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
        loginButton.addTarget(self, action: #selector(goToHomeVC), for: .touchUpInside)
        
        let forgotPassButton = UIButton(type: .system)
        forgotPassButton.setTitle("Forgot password?", for: .normal)
        forgotPassButton.setTitleColor(UIColor(red: 0.238, green: 0.356, blue: 0.95, alpha: 1), for: .normal)
        forgotPassButton.backgroundColor = .clear
        
        vStackView = UIStackView(arrangedSubviews: textFields.map ({ (image, placeholder, type, keyboard) in
            let textField = UITextField()
            addLeftImage(textField: textField, image: image)
            textField.placeholder = placeholder
            textField.textContentType = type
            textField.keyboardType = keyboard
            
            if type == .password {
                textField.isSecureTextEntry = true
            }
            
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor(red: 0.902, green: 0.902, blue: 0.902, alpha: 1).cgColor
            textField.layer.cornerRadius = 12
            textField.layer.cornerCurve = .continuous
            textField.clipsToBounds = true
            
            textField.snp.makeConstraints { make in
                make.height.equalTo(48)
            }
            
            return textField
        }))
        
        vStackView.axis = .vertical
        vStackView.spacing = 16
        
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
        formView.addSubview(vStackView)
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
            make.top.equalTo(vStackView.snp.bottom).offset(24)
            make.trailing.equalTo(formView).offset(-24)
        }
        
        loginButton.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.top.equalTo(forgotPassButton.snp.bottom).offset(24)
            make.leading.trailing.equalTo(formView).inset(24)
        }
        
        vStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.leading.trailing.equalTo(formView).inset(24)
        }
        
        hStackView.snp.makeConstraints { make in
            make.bottom.equalTo(formView.safeAreaLayoutGuide.snp.bottom).offset(-24)
            make.centerX.equalTo(formView.snp.centerX)
        }
    }
    
    func addLeftImage(textField: UITextField, image: UIImage) {
        let padding = 16
        let boundingView = UIView(frame: CGRect(x: 0, y: 0, width: image.size.width + CGFloat(padding + 8), height: image.size.height) )
        let imageView = UIImageView(frame: CGRect(x: CGFloat(padding), y: 0, width: image.size.width, height: image.size.height))
        imageView.image = image
        boundingView.addSubview(imageView)
        textField.leftView = boundingView
        textField.leftViewMode = .always
    }
}
