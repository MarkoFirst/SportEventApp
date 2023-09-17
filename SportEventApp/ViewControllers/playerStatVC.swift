//
//  playerStatVC.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 14.09.2023.
//

import Foundation
import SnapKit
import UIKit

class playerStatVC: UIViewController {

    let scrollview = UIScrollView()
    let backBtn = UIButton()
    let shareBtn = UIButton()
    let saveBtn = UIButton()
    let teamLabelView = UIImageView()
    let ronaldo = UIImageView()
    let portugal = UIImageView()
    let juventusLogoDesc = UIImageView()
    let playerName = UILabel()
    let positionSVArr: [(UIImageView, UILabel)] = [(UIImageView(), UILabel())]
    var positionSV = UIStackView()
    var achivementsCollView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    var humanArr = [UIImage]()
    let discussingSVArr: [(UIImageView, UILabel, UIView)] = [(UIImageView(), UILabel(), UIView())]
    var discussingSV = UIStackView()
    var discussionTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollview.isScrollEnabled = true
        scrollview.contentSize = CGSize(width: view.frame.width, height: 2000)
        view.backgroundColor = .black
        
        view.addSubview(scrollview)
        //MARK: BACK BUTTON
        backBtn.contentMode = .scaleAspectFit
        backBtn.setImage(UIImage(named: "back"), for: .normal)
        scrollview.addSubview(backBtn)
        //MARK: SHARE BUTTON
        shareBtn.contentMode = .scaleAspectFit
        shareBtn.setImage(UIImage(named: "share"), for: .normal)
        scrollview.addSubview(shareBtn)
        //MARK: SAVE BUTTON
        saveBtn.contentMode = .scaleAspectFit
        saveBtn.setImage(UIImage(named: "save"), for: .normal)
        scrollview.addSubview(saveBtn)
        //MARK: COUNTRY FLAG
        teamLabelView.image = UIImage(named: "juventusSVG")
        scrollview.addSubview(teamLabelView)
        //MARK: PLAYER PHOTO
        ronaldo.image = UIImage(named: "ronaldo")
        scrollview.addSubview(ronaldo)
        //MARK: COUNTRY FLAG
        portugal.image = UIImage(named: "portugal")
        portugal.clipsToBounds = true
        portugal.layer.cornerRadius = (portugal.image?.size.height ?? 0) / 2
        scrollview.addSubview(portugal)
        //MARK: TEAM BG LOGO
        juventusLogoDesc.image = UIImage(named: "juventusLogoDesc")
        juventusLogoDesc.clipsToBounds = true
        juventusLogoDesc.layer.cornerRadius = (juventusLogoDesc.image?.size.height ?? 0) / 2
        scrollview.addSubview(juventusLogoDesc)
        //MARK: PLAYER NAME
        playerName.text = "Ronaldo"
        playerName.textColor = .white
        playerName.font = .systemFont(ofSize: 40, weight: .heavy)
        scrollview.addSubview(playerName)
        //MARK: POSITION OF PLAYER
        positionSV = UIStackView(arrangedSubviews: positionSVArr.map({ imageView, label in
            let viewInSV = UIView()
            
            label.text = "FORWARD"
            label.textColor = .gray
            label.font = .systemFont(ofSize: 20, weight: .black)
            
            imageView.image = UIImage(named: "ronaldoPos") ?? UIImage()
            
            viewInSV.addSubview(label)
            viewInSV.addSubview(imageView)
            
            
            
            viewInSV.snp.makeConstraints {
                $0.height.equalTo(30)
                //$0.width.equalTo(200)
            }
            
            imageView.snp.makeConstraints {
                $0.centerY.equalTo(viewInSV.snp.centerY)
                $0.left.equalTo(viewInSV.snp.left)
            }
            
            label.snp.makeConstraints {
                $0.left.equalTo(imageView.snp.right)
                $0.bottom.equalTo(viewInSV.snp.bottom).inset(-4)
            }
            return viewInSV
        }))
        scrollview.addSubview(positionSV)
        
        //MARK: ACHIVEMENTS COLLECTION VIEW
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 116.0, height: 100.0)
        layout.scrollDirection = .horizontal
        
        achivementsCollView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 200), collectionViewLayout: layout)
        achivementsCollView.backgroundColor = .clear
        
        achivementsCollView.delegate = self
        achivementsCollView.dataSource = self
        
        achivementsCollView.register(AgeCollectionViewCell.self, forCellWithReuseIdentifier: "cell1")
        achivementsCollView.register(GamesCollectionViewCell.self, forCellWithReuseIdentifier: "cell2")
        achivementsCollView.register(GoalsCollectionViewCell.self, forCellWithReuseIdentifier: "cell3")
        
        
        scrollview.addSubview(achivementsCollView)
        //MARK: DISCUSSING STACKVIEW
        discussingSV = UIStackView(arrangedSubviews: discussingSVArr.map({ (imageView, label, view) in
            let viewInSV = UIView()
            
            label.text = "Now discussing"
            label.textColor = .systemBlue
            label.font = .systemFont(ofSize: 17, weight: .bold)
            
            imageView.image = UIImage(named: "disscusingImage") ?? UIImage()
            imageView.contentMode = .scaleAspectFill
            
            humanArr = [
                UIImage(named: "h1") ?? UIImage(),
                UIImage(named: "h2") ?? UIImage(),
                UIImage(named: "h3") ?? UIImage(),
                UIImage(named: "h4") ?? UIImage(),
                UIImage(named: "h5") ?? UIImage()
            ]
            
            let sv = UIStackView()
            sv.axis = .horizontal
            sv.alignment = .center
            sv.spacing = -20
            sv.distribution = .fill
            
            humanArr.forEach { image in
                let imageView = UIImageView(image: image)
                imageView.contentMode = .scaleAspectFit
                imageView.widthAnchor.constraint(equalToConstant: 36).isActive = true
                sv.addArrangedSubview(imageView)
                view.addSubview(sv)
            }
            
            viewInSV.addSubview(label)
            viewInSV.addSubview(imageView)
            viewInSV.addSubview(view)
            
            
            sv.snp.makeConstraints {
                $0.left.right.top.bottom.equalTo(view)
            }
            
            
            viewInSV.snp.makeConstraints {
                $0.height.equalTo(30)
                //$0.width.equalTo(200)
            }
            
            imageView.snp.makeConstraints {
                $0.centerY.equalTo(viewInSV.snp.centerY)
                $0.left.equalTo(viewInSV.snp.left)
                $0.height.width.equalTo(32)
            }
            
            label.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.left.equalTo(imageView.snp.right)
                $0.centerY.equalTo(viewInSV.snp.centerY)
            }
            
            view.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.left.equalTo(label.snp.right).inset(-40)
                $0.right.equalTo(viewInSV.snp.right)
                $0.centerY.equalTo(viewInSV.snp.centerY)
            }
            
            return viewInSV
        }))
        scrollview.addSubview(discussingSV)
        
        //MARK: TABLE VIEW
        discussionTableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 700), style: .insetGrouped)
        discussionTableView.backgroundColor = .clear
        discussionTableView.isScrollEnabled = false

        discussionTableView.dataSource = self
        discussionTableView.delegate = self
        
        discussionTableView.register(LatestNewsTableViewCell.self, forCellReuseIdentifier: "cell1")
        discussionTableView.register(RateTableViewCell.self, forCellReuseIdentifier: "cell2")
        
        
        scrollview.addSubview(discussionTableView)
        
        //MARK: CONSTRAINTS
        
        scrollview.snp.makeConstraints {
            $0.edges.equalToSuperview()
            
        }
        
        backBtn.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.left.equalToSuperview().inset(8)
            $0.height.equalTo(36)
            $0.width.equalTo(36)
        }
        
        shareBtn.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.right.equalTo(view).inset(8)
            $0.height.equalTo(36)
            $0.width.equalTo(36)
        }
        
        saveBtn.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.right.equalTo(shareBtn.snp.left).inset(-8)
            $0.height.equalTo(36)
            $0.width.equalTo(36)
        }
        
        teamLabelView.snp.makeConstraints {
            $0.top.equalTo(backBtn).inset(48)
            $0.left.equalToSuperview().inset(-32)
        }
        
        ronaldo.snp.makeConstraints {
            $0.top.equalTo(backBtn).inset(84)
            $0.left.equalToSuperview().inset(84)
        }
        
        juventusLogoDesc.snp.makeConstraints {
            $0.top.equalTo(backBtn.snp.bottom).inset(-64)
            $0.left.equalToSuperview().inset(16)
        }
        
        portugal.snp.makeConstraints {
            $0.top.equalTo(backBtn.snp.bottom).inset(-64)
            $0.centerX.equalTo(juventusLogoDesc.snp.right).inset(-6)
        }
        
        playerName.snp.makeConstraints {
            $0.top.equalTo(juventusLogoDesc.snp.bottom).inset(-16)
            $0.left.equalToSuperview().inset(16)
        }
        
        positionSV.snp.makeConstraints {
            $0.top.equalTo(playerName.snp.bottom).inset(-200)
            $0.left.equalToSuperview().inset(16)
            //$0.right.equalToSuperview().inset(100)
            $0.right.equalTo(juventusLogoDesc.snp.left).inset(140)
        }
        
        achivementsCollView.snp.makeConstraints {
            $0.top.equalTo(ronaldo.snp.bottom).inset(2)
            $0.left.right.equalTo(view).inset(12)
            $0.height.equalTo(100)
        }
        
        discussingSV.snp.makeConstraints {
            $0.top.equalTo(achivementsCollView.snp.bottom).inset(-16)
            $0.left.right.equalTo(view).inset(16)
        }
        
        discussionTableView.snp.makeConstraints {
            $0.top.equalTo(discussingSV.snp.bottom).inset(-16)
            $0.left.right.equalTo(view)
            $0.height.equalTo(700)
        }
        
        
    }
}


extension playerStatVC: UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: COLLECTIONVIEW SETUP
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        
        switch indexPath.item {
        case 0:
            cell = achivementsCollView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath)
            return cell
        case 1:
            cell = achivementsCollView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath)
            return cell
        case 2:
            cell = achivementsCollView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath)
            return cell
        default:
            cell = UICollectionViewCell()
            return cell
        }
    }
    
    //MARK: TABLEVIEW SETUP
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.section {
        case 0:
            cell = discussionTableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
            cell.selectionStyle = .none
            return cell
        case 1:
            cell = discussionTableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
            cell.selectionStyle = .none
            return cell
//        case 2:
//            cell = discussionTableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath)
//            return cell
//        case 3:
//            cell = discussionTableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath)
//            return cell
        default:
            cell = UITableViewCell()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 150
        case 1:
            return 312
//        case 2:
//            return 200
//        case 4:
//            return 150
        default:
            return 0.0
        }
    }
    
}
