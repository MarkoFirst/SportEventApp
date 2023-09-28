//
//  ViewController.swift
//  SportEventApp
//
//  Created by MF-Citrus on 25.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func toLogin(_ sender: UIButton) {
        navigationController?.pushViewController(LoginVC(), animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
}

