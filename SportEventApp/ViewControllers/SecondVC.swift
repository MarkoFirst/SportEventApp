//
//  SecondVC.swift
//  SportEventApp
//
//  Created by MF-Citrus on 28.09.2023.
//

import Foundation
import UIKit
import SnapKit

protocol MemoryDelegate: UIViewController {
    func printX(_ str: String)
}

class SecondVC: UIViewController {
    weak var delegate: MemoryDelegate?
    
    var count: UILabel!
    
    var y = 0 {
        didSet {
            count.text = y.description
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        struct UserS {
            var name: String
            var userRef: UserRef = UserRef(name: "Kate")
        }
        
        var obj = UserS(name: "Vadim")
        
        let c = { [obj] in // { name: "Vadim", userRef: sddjh43rbhj }
            print(obj.userRef.name)
        }
        
        obj.name = "Dima"
        obj.userRef.name = "Alena"
        c()
        
        count = UILabel()
        count.text = Date().timeIntervalSince1970.description
        count.textColor = .white
        count.font = .boldSystemFont(ofSize: 60)
        view.addSubview(count)
        
        let iv = UIImageView(image: UIImage(named: "gtr")!)
        view.addSubview(iv)
        
        let btn = UIButton(type: .system)
        btn.setTitle("Tap", for: .normal)
        btn.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        btn.backgroundColor = .blue
        btn.setTitleColor(.white, for: .normal)
        view.addSubview(btn)
        
        count.snp.makeConstraints { $0.center.equalToSuperview() }
        
        iv.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(60)
            $0.height.width.equalTo(100)
        }
        
        btn.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(60)
            $0.height.width.equalTo(60)
        }
        
        DispatchQueue.main
            .asyncAfter(deadline: .now() + 10) {// [weak self] in
//                guard let self else { return }
//                print(self.delegate?.x)
            }
    }
    
    @objc
    private func didTap() {
        delegate?.printX(count.text ?? "")
        navigationController?.popToRootViewController(animated: true)
    }
    
    deinit {
        print("SecondVC deinit")
    }
}
