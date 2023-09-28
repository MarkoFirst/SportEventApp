//
//  MemoryVC.swift
//  SportEventApp
//
//  Created by MF-Citrus on 28.09.2023.
//

import Foundation
import UIKit
import SnapKit

class MemoryVC: UIViewController {
    var x = 10
    var someLabel: UILabel = UILabel()
    
    lazy var count: UILabel = {
        let count = UILabel()
        count.text = x.description + " init"
        count.textColor = .white
        count.font = .boldSystemFont(ofSize: 60)
        view.addSubview(count)
        
        count.snp.makeConstraints { $0.center.equalToSuperview() }
        
        return count
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        
        let vc = SecondVC()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
        
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 50) { [weak vc]
        //            vc.y = 20
        //        }
        
        x += 1
        
        UITableView().dataSource
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print(#function)
        print(navigationController?.viewControllers.count)
    }
    
    @objc
    private func addOne() {
        
    }
}

extension MemoryVC: MemoryDelegate {
    func printX(_ str: String) {
//        count.text = x.description
        print(count.text)
        UIView.animate(withDuration: 1) {
            self.count.text = str
        }
    }
}

//class Memory2VC: UIViewController, MemoryDelegate {
//    func printX() {
//        print(2)
//    }
//}

class UserRef {
    var name: String = ""
    var age = 22
    
    init(name: String) {
        self.name = name
        
        print("UserRef: \(name) init")
    }
    
    deinit {
        print("UserRef: \(name) deiniting")
    }
}

extension MemoryVC {
    private func setupLayout() {
        let btn = UIButton(type: .system)
        btn.setTitle("Add +1", for: .normal)
        btn.addTarget(self, action: #selector(addOne), for: .touchUpInside)
        btn.backgroundColor = .blue
        btn.setTitleColor(.white, for: .normal)
        view.addSubview(btn)
        
        btn.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(60)
            $0.height.width.equalTo(60)
        }
    }
}
