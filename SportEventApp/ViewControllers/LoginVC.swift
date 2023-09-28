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
    
    let backImage = UIImageView(image: UIImage(named: "target"))
    let formView = UIView()
    let titleLabel = UILabel()
    let loginButton = UIButton(type: .system)
    let forgotPassButton = UIButton(type: .system)
    var vStackView = UIStackView()
    let questionLabel = UILabel()
    let signupButton = UIButton()
    let hStackView = UIStackView()
    
    let textFields: [(UIImage, String, UITextContentType, UIKeyboardType)] = [
        (UIImage(named: "envelope")!, "Email or username", .emailAddress, .emailAddress),
        (UIImage(named: "lock")!, "Password", .password, .default)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = false
        
        configureBackImage()
        configureFormView()
        configureTitleLabel()
        configureForgotPassButton()
        configureLoginButton()
        configureVStackView()
        configureHStackView()
        
        setConstrains()
        
        dismissKeyboard()
    }
    
    func configureBackImage() {
        view.addSubview(backImage)
        backImage.contentMode = .scaleAspectFill
    }
    
    func configureFormView() {
        view.addSubview(formView)
        formView.backgroundColor = .white
        formView.layer.cornerRadius = 20
        formView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        formView.layer.cornerCurve = .continuous
        
    }
    
    func configureTitleLabel() {
        formView.addSubview(titleLabel)
        titleLabel.text = "Welcome back!"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .medium)
    }
    
    func configureLoginButton() {
        formView.addSubview(loginButton)
        loginButton.setTitle("Log in", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 12
        loginButton.layer.cornerCurve = .continuous
        loginButton.clipsToBounds = true
        loginButton.backgroundColor = UIColor(red: 0.239, green: 0.357, blue: 0.949, alpha: 1)
        
        loginButton.addTarget(self, action: #selector(goToHomeVC), for: .touchUpInside)
    }
    
    func configureForgotPassButton() {
        formView.addSubview(forgotPassButton)
        forgotPassButton.setTitle("Forgot password?", for: .normal)
        forgotPassButton.setTitleColor(UIColor(red: 0.238, green: 0.356, blue: 0.95, alpha: 1), for: .normal)
        forgotPassButton.backgroundColor = .clear
//        forgotPassButton.setContentHuggingPriority(.required, for: .horizontal)
//        forgotPassButton.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
    }
    
    func configureVStackView() {
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
        formView.addSubview(vStackView)
        vStackView.axis = .vertical
        vStackView.spacing = 16
        
        vStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.leading.trailing.equalTo(formView).inset(24)
        }
    }
    
    func configureHStackView() {
        formView.addSubview(hStackView)
        hStackView.axis = .horizontal
        hStackView.alignment = .center
        hStackView.distribution = .fillProportionally
        hStackView.spacing = 4
        
        configureQuestionLabel()
        configureSignupButton()
    }
    
    func configureQuestionLabel() {
        hStackView.addArrangedSubview(questionLabel)
        questionLabel.text = "Don't have an account?"
        questionLabel.textColor = .black
        questionLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
    }
    
    func configureSignupButton() {
        hStackView.addArrangedSubview(signupButton)
        signupButton.setTitle("Sign up", for: .normal)
        signupButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
        signupButton.setTitleColor(UIColor(red: 0.238, green: 0.356, blue: 0.95, alpha: 1), for: .normal)
        signupButton.backgroundColor = .clear
        
        signupButton.addTarget(self, action: #selector(goSignupVC), for: .touchUpInside)
    }
    
    func setConstrains() {
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
        
        hStackView.snp.makeConstraints { make in
            make.bottom.equalTo(formView.safeAreaLayoutGuide.snp.bottom).offset(-24)
            make.centerX.equalTo(formView.snp.centerX)
        }
    }
    
    @objc func goToHomeVC() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "homeID") as! HomeVC
                self.navigationController?.pushViewController(nextViewController, animated: true)

    }
        
    @objc func goSignupVC () {
        navigationController?.pushViewController(SignupVC(), animated: true)
    }
}

extension LoginVC {
    
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

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}


