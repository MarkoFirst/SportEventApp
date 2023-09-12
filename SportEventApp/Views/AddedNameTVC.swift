//
//  AddedNameTVC.swift
//  SportEventApp
//
//  Created by MF-Citrus on 29.08.2023.
//

import Foundation
import UIKit


@IBDesignable
class AddedNameTVC: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var customContentView: UIView!
    
    @IBAction func tapToEdit(_ sender: UIButton) {
        print(sender.titleLabel?.text)
        
        
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        btn.setTitle("error btn", for: .normal)
        btn.backgroundColor = .red
        btn.addTarget(self, action: #selector(errorTap), for: .touchUpInside)
        addSubview(btn)
        
        
        contentView.bringSubviewToFront(customContentView)
        
        layoutIfNeeded()
        
    }
    
    @objc func errorTap() {
        print(#function)
    }
}


