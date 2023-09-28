//
//  AnimateVC.swift
//  SportEventApp
//
//  Created by MF-Citrus on 26.09.2023.
//

import Foundation
import SnapKit
import UIKit

class AnimateVC: UIViewController {
    private var orangeView: UIView!
    private var btn: UIButton!
    
    private var didAnimate = false
    
    private var animator: UIDynamicAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    private func setupLayout() {
        view.backgroundColor = .gray
        
        orangeView = UIView(frame: CGRect(x: 200, y: 200, width: 100, height: 100))
        orangeView.backgroundColor = .orange
        orangeView.layer.cornerRadius = 10
        view.addSubview(orangeView)
        
        btn = UIButton(type: .system)
        btn.setTitle("Animate", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(startAnimationDynamics), for: .touchUpInside)
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = 10
        view.addSubview(btn)
        
        btn.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(60)
            $0.height.equalTo(60)
            $0.width.equalTo(200)
        }
        
//        orangeView.snp.makeConstraints {
//            $0.bottom.equalTo(btn.snp.top).inset(-16)
//            $0.centerX.equalToSuperview()
//            $0.height.width.equalTo(60)
//        }
    }
    
    @objc
    private func startAnimation() {
        didAnimate.toggle()
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0,
//            options: [.transitionFlipFromRight],
            animations:  {
//                self.orangeView.frame = CGRect(
//                    x:      self.didAnimate ? 50 : 0,
//                    y:      self.didAnimate ? 100 : 0,
//                    width:  self.didAnimate ? 150 : self.view.frame.width,
//                    height: self.didAnimate ? 200 : self.view.frame.height - 200
//                )
                
//                self.orangeView.transform = self.orangeView.transform
//                    .translatedBy(x: 60, y: 20)
//                    .scaledBy(x: 0.8, y: 0.9)
//                    .rotated(by: 30)
                
                
            }
        )
//        }, completion: { success in
//            if success && self.didAnimate {
//                let label = UILabel()
//                label.text = "some"
//                label.font = .boldSystemFont(ofSize: 40)
//                self.orangeView.addSubview(label)
//
//                label.snp.makeConstraints { $0.center.equalToSuperview() }
//            }
//        })
        
        
        
//        UIView.animate(
//            withDuration: 0.5,
//            delay: 0,
//            //            usingSpringWithDamping: <#T##CGFloat#>,
//            //            initialSpringVelocity: <#T##CGFloat#>,
//            options: [.transitionCurlDown],
//            animations: {
//                self.orangeView.frame = CGRect(x: 300, y: 500, width: 400, height: 100)
//                self.orangeView.layer.cornerRadius = 50
//
//            }
//        )
    }
    
    
    
    
    @objc
    private func startAnimationKeys() {
        UIView.animateKeyframes(withDuration: 3, delay: 0) {
            UIView.addKeyframe(
                withRelativeStartTime: 0,
                relativeDuration: 1,
                animations: {
                    self.orangeView.transform = self.orangeView.transform
                        .translatedBy(x: 60, y: 110)
                })
            
//            UIView.addKeyframe(
//                withRelativeStartTime: 0.33,
//                relativeDuration: 1,
//                animations: {
//                    self.orangeView.transform = self.orangeView.transform
//                        .scaledBy(x: 2, y: 2)
//                })
            
            UIView.addKeyframe(
                withRelativeStartTime: 0.66,
                relativeDuration: 1,
                animations: {
                    self.btn.snp.updateConstraints {
                        $0.width.height.equalTo(400)
                        $0.bottom.equalToSuperview().inset(600)
                    }
                    
//                    self.orangeView.snp.updateConstraints {
//                        $0.width.equalTo(600)
//                    }
                    self.view.layoutIfNeeded()
                })
        }
    }
    
    
    
    
    @objc
    private func startAnimationDynamics() {
        
        animator = UIDynamicAnimator(referenceView: self.view)
        
        let gravity = UIGravityBehavior(items: [orangeView])
        animator.addBehavior(gravity)
        
        let collision = UICollisionBehavior(items: [orangeView])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
//        animator.
//        view
    }
    
    
    
    
    
    
    @objc
    private func startAnimationSnp() {
        UIView.animate(withDuration: 5) {
            self.btn.snp.updateConstraints {
                $0.width.height.equalTo(400)
                $0.bottom.equalToSuperview().inset(600)
            }
            
            self.orangeView.snp.updateConstraints {
                $0.width.equalTo(600)
            }
            self.view.layoutIfNeeded()
        }
    }
}
    
    
    
    
    
    





//
//    private func setupLayout() {
//        view.backgroundColor = .lightGray
//
//        let tv = UITableView()
//        tv.dataSource = self
//        tv.delegate = self
//        view.addSubview(tv)
//
//        tv.register(TestTVC.self, forCellReuseIdentifier: "test")
//
//        tv.snp.makeConstraints { $0.edges.equalToSuperview() }
//    }
//}
//
//extension AnimateVC: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "test", for: indexPath) as? TestTVC else {
//            return UITableViewCell()
//        }
//
//        let element = [42, 132, 5]
//        cell.setupCell(age: element[0], games: element[1], goals: element[2].description)
//
//        return cell
//    }
//}
//
//class TestTVC: UITableViewCell {
//    private var stackView: UIStackView!
//
//    required override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        let titleList = ["age", "games", "goals"]
//        let spacing: CGFloat = 12
//        stackView = UIStackView(arrangedSubviews: titleList.map { titleText in
//            let view = UIView()
//            view.backgroundColor = .darkGray
//            view.layer.cornerRadius = 10
//
//            let title = UILabel()
//            title.text = titleText
//            title.textColor = .white
//            view.addSubview(title)
//
//            let count = UILabel()
//            count.text = 100.description
//            count.textColor = .white
//            count.font = .boldSystemFont(ofSize: 24)
//            count.textAlignment = .left
//            count.tag = 111
//            view.addSubview(count)
//
//            let iv = UIView()
//            iv.backgroundColor = .blue
//            view.addSubview(iv)
//
//            title.snp.makeConstraints {
//                $0.top.leading.trailing.equalToSuperview().inset(16)
//            }
//
//            count.snp.makeConstraints {
//                $0.bottom.leading.equalToSuperview().inset(16)
//            }
//
//            iv.snp.makeConstraints {
////                $0.height.equalTo(60)
////                $0.width.equalTo(20)
//                $0.trailing.bottom.equalToSuperview().inset(16)
//                $0.leading.equalTo(count.snp.trailing).offset(16)
//                $0.top.equalTo(title.snp.bottom).offset(24)
//            }
//
//            return view
//        })
//        stackView.axis = .horizontal
//        stackView.spacing = spacing
//        stackView.distribution = .fillEqually
//        contentView.addSubview(stackView)
//
//        let width = 430 // contentView.frame.width
//        let count = titleList.count
//        let itemHeight = (width - 8 * 2 - Int(spacing) * (count - 1)) / count
//
//        stackView.snp.makeConstraints {
//            $0.edges.equalToSuperview().inset(8)
//            $0.height.equalTo(itemHeight)
//        }
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func setupCell(age: Int, games: Int, goals: String) {
//        let labelList = stackView.arrangedSubviews.compactMap {
//            $0.subviews.first(where: { $0.tag == 111 } ) as? UILabel
//        }
//
//        labelList[0].text = age.description
//        labelList[1].text = games.description
//        labelList[2].text = goals
//    }
//}
