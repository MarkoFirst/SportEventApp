//
//  DescriptionViewController.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 07.09.2023.
//

import UIKit

class DescriptionViewController: UIViewController {
    @IBOutlet weak var descriptionTitle: UILabel!
    @IBOutlet weak var descriptionDescription: UILabel!
    @IBOutlet weak var descriptionImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTitle.text = testFinishedEvent.title
        descriptionDescription.text = testFinishedEvent.description
        descriptionImage.image = UIImage(named: "zlatan")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pushToProfile(_ sender: UIButton) {
        navigationController?.pushViewController(PlayerStatVC(), animated: true)
    }
}
