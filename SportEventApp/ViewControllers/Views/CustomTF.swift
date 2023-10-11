//
//  CustomTF.swift
//  SportEventApp
//
//  Created by Dima Kahanets on 04.10.2023.
//

import Foundation
import SnapKit
import UIKit

class CustomTF: UIView {
    
    private var imageView: UIImageView!
    var textField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
}

extension CustomTF {
    
    private func setupView() {
        
        // MARK: Configure views
        
        lazy var wrapperView = UIView()
        wrapperView.layer.borderWidth = 1
        wrapperView.layer.borderColor = UIColor(red: 0.902, green: 0.902, blue: 0.902, alpha: 1).cgColor
        wrapperView.layer.cornerRadius = 12
        wrapperView.layer.cornerCurve = .continuous
        wrapperView.clipsToBounds = true
        
        lazy var boundingView = UIView()
        
        imageView = UIImageView()
        
        textField = UITextField()
        textField.borderStyle = .none
        
        // MARK: Adding views
        
        self.addSubview(wrapperView)
        wrapperView.addSubview(boundingView)
        wrapperView.addSubview(textField)
        
        boundingView.addSubview(imageView)
        
        // MARK: Setup constraints
        
        wrapperView.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.edges.equalTo(self)
        }
        
        boundingView.snp.makeConstraints { make in
            make.size.equalTo(48)
            make.centerY.equalTo(wrapperView.snp.centerY)
            make.leading.equalTo(wrapperView)
        }
        
        imageView.snp.makeConstraints { make in
            make.size.equalTo(24)
            make.center.equalTo(boundingView)
        }
        
        textField.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.centerY.equalTo(wrapperView.snp.centerY)
            make.leading.equalTo(boundingView.snp.trailing)
            make.trailing.equalTo(wrapperView)
        }
    }
    
    func configure(
        image: UIImage,
        placeholder: String,
        textContentType: UITextContentType,
        keyboardType: UIKeyboardType,
        isSecureTextEntry: Bool
    ) {
        imageView.image = image
        textField.placeholder = placeholder
        textField.textContentType = textContentType
        textField.keyboardType = keyboardType
        textField.isSecureTextEntry = isSecureTextEntry
    }
    
    func getText() -> String? {
        return textField.text
    }
    
    func setText(_ text: String?) {
        textField.text = text
    }
}
