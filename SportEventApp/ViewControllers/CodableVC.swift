//
//  CodableVC.swift
//  SportEventApp
//
//  Created by MF-Citrus on 07.09.2023.
//

import Foundation
import SnapKit
import UIKit

class CodableVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backImage = UIImageView(image: UIImage(named: "back"))
        view.addSubview(backImage)
        
        let formView = UIView()
        formView.backgroundColor = UIColor(red: 0.216, green: 0.22, blue: 0.243, alpha: 1)
        formView.layer.cornerRadius = 16
        view.addSubview(formView)
        
        let titleLabel = UILabel()
        titleLabel.text = "Sign Up"
        titleLabel.font = UIFont.systemFont(ofSize: 44, weight: .semibold)
        titleLabel.textColor = .white
        formView.addSubview(titleLabel)
        
        let array: [(UIImage, String, UITextContentType)] = [
            (UIImage(named: "user")!, "Full Name", .name),
            (UIImage(named: "user")!, "Email", .emailAddress),
            (UIImage(named: "user")!, "Password", .password)
        ]
        
        let stackView = UIStackView(arrangedSubviews: array.map({ item in
            let textField = UITextField()
            textField.placeholder = item.1
            textField.textContentType = item.2
            textField.textColor = .white
            textField.layer.cornerRadius = 10
            textField.layer.borderColor = UIColor.gray.cgColor
            textField.layer.borderWidth = 1
            textField.textColor = .white
            
            let image = UIImageView(image: item.0)
            textField.addSubview(image)
            
            image.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.trailing.equalToSuperview().inset(8)
                $0.width.height.equalTo(24)
            }
            textField.snp.makeConstraints {
                $0.height.equalTo(60)
            }
            
            return textField
        }))
        stackView.axis = .vertical
        stackView.spacing = 8
        formView.addSubview(stackView)
        
        let btn = UIButton(type: .system)
        btn.setTitle("Sign Up", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .darkGray
        btn.layer.cornerRadius = 10
        btn.layer.cornerCurve = .continuous
        btn.addTarget(self, action: #selector(nextTap), for: .touchUpInside)
        formView.addSubview(btn)
        
        backImage.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(250)
        }
        
        formView.snp.makeConstraints {
            $0.top.equalTo(backImage.snp.bottom).inset(20)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(24)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).inset(-44)
            $0.leading.trailing.equalToSuperview().inset(24)
        }
        
        btn.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).inset(-44)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(60)
        }
    }
    
    @objc
    func nextTap() {
        navigationController?.pushViewController(CodableVC(), animated: true)
//        present(CodableVC(), animated: true)
    }
}

