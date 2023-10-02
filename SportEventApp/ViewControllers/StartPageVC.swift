//
//  StartPageVC.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 08.09.2023.
//

import Foundation
import UIKit

class StartPageVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func SignInBtn(_ sender: UIButton) {
        let vc = SignInVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "signUpStoryboard") as! SignUpVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
