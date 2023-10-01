//
//  playerStatVC.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 14.09.2023.
//

import Foundation
import SnapKit
import UIKit

class PlayerStatVC: UIViewController {

    private var discussionTableView = UITableView()


    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension PlayerStatVC: UITableViewDataSource, UITableViewDelegate {

    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
    
    func setup() {
        
        //MARK: SCROLLVIEW
        
        let scrollview = UIScrollView()
        scrollview.isScrollEnabled = true
        scrollview.isUserInteractionEnabled = true

        scrollview.contentSize = CGSize(width: view.frame.width, height: 1700)
        view.backgroundColor = .black
        view.addSubview(scrollview)
        
        //MARK: BACK BUTTON
        
        let backBtn = UIButton()
        backBtn.contentMode = .scaleAspectFit
        backBtn.setImage(UIImage(named: "back"), for: .normal)
        backBtn.addTarget(self, action: #selector(back), for: .touchUpInside)
        scrollview.addSubview(backBtn)
        
        //MARK: SHARE BUTTON
        
        let shareBtn = UIButton()
        shareBtn.contentMode = .scaleAspectFit
        shareBtn.setImage(UIImage(named: "share"), for: .normal)
        scrollview.addSubview(shareBtn)
        
        //MARK: SAVE BUTTON
        
        let saveBtn = UIButton()
        saveBtn.contentMode = .scaleAspectFit
        saveBtn.setImage(UIImage(named: "save"), for: .normal)
        scrollview.addSubview(saveBtn)
        
        //MARK: TEAM LABEL
        
        let teamLabelView = UIImageView()
        teamLabelView.image = UIImage(named: "juventusSVG")
        scrollview.addSubview(teamLabelView)
        
        //MARK: PLAYER PHOTO
        
        let ronaldo = UIImageView()
        ronaldo.image = UIImage(named: "ronaldo")
        scrollview.addSubview(ronaldo)
        
        //MARK: COUNTRY FLAG
        
        let portugal = UIImageView()
        portugal.image = UIImage(named: "portugal")
        portugal.clipsToBounds = true
        portugal.layer.cornerRadius = (portugal.image?.size.height ?? 0) / 2
        //scrollview.addSubview(portugal)
        
        //MARK: TEAM BG LOGO
        
        let juventusLogoDesc = UIImageView()
        juventusLogoDesc.image = UIImage(named: "juventusLogoDesc")
        juventusLogoDesc.clipsToBounds = true
        juventusLogoDesc.layer.cornerRadius = (juventusLogoDesc.image?.size.height ?? 0) / 2
        scrollview.addSubview(juventusLogoDesc)
        
        //MARK: TEAM/COUNTRY STACKVIEW
        
        let teamCountrySV = UIStackView()
        teamCountrySV.spacing = -12
        teamCountrySV.addArrangedSubview(portugal)
        teamCountrySV.addArrangedSubview(juventusLogoDesc)
        scrollview.addSubview(teamCountrySV)
        
        //MARK: PLAYER NAME
        
        let playerName = UILabel()
        playerName.text = "Ronaldo"
        playerName.textColor = .white
        playerName.font = .systemFont(ofSize: 40, weight: .heavy)
        scrollview.addSubview(playerName)
        
        //MARK: POSITION OF PLAYER
        
        var positionSV = UIStackView()
        let positionSVArr: [(UIImageView, UILabel)] = [(UIImageView(), UILabel())]
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

        //MARK: TABLE VIEW
        
        discussionTableView = UITableView(frame: CGRect.zero, style: .insetGrouped)
        discussionTableView.backgroundColor = .clear
        discussionTableView.isScrollEnabled = false
        discussionTableView.isUserInteractionEnabled = true
        
        discussionTableView.dataSource = self
        discussionTableView.delegate = self
        
        discussionTableView.register(PlayerDataTableViewCell.self,   forCellReuseIdentifier: "cell1")
        discussionTableView.register(DiscussionTableViewCell.self,   forCellReuseIdentifier: "cell2")
        discussionTableView.register(LatestNewsTableViewCell.self,   forCellReuseIdentifier: "cell3")
        discussionTableView.register(RateTableViewCell.self,         forCellReuseIdentifier: "cell4")
        discussionTableView.register(TrophiesTableViewCell.self,     forCellReuseIdentifier: "cell5")
        discussionTableView.register(HistoryTableViewCell.self,      forCellReuseIdentifier: "cell6")
        
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
            $0.centerX.equalToSuperview().inset(-32)
        }
        
        ronaldo.snp.makeConstraints {
            $0.top.equalTo(backBtn).inset(84)
            $0.centerX.equalTo(teamLabelView.snp.centerX).offset(60)
        }
        
        teamCountrySV.snp.makeConstraints {
            $0.top.equalTo(backBtn.snp.bottom).inset(-64)
            $0.centerX.equalTo(ronaldo.snp.left).inset(-20)
        }
        
        playerName.snp.makeConstraints {
            $0.top.equalTo(teamCountrySV.snp.bottom).inset(-16)
            $0.left.equalTo(teamCountrySV.snp.left)
        }
        
        positionSV.snp.makeConstraints {
            $0.top.equalTo(playerName.snp.bottom).inset(-200)
            $0.left.equalTo(playerName.snp.left)
            $0.right.equalTo(juventusLogoDesc.snp.left).inset(140)
        }
        
        discussionTableView.snp.makeConstraints {
            $0.top.equalTo(positionSV.snp.bottom).inset(30)
            $0.left.right.equalTo(view)
            $0.bottom.equalTo(view.snp.bottom)
        }
    }
    
    //MARK: TABLEVIEW SETUP
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.section {
        case 0:
            cell = discussionTableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        case 1:
            cell = discussionTableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        case 2:
            cell = discussionTableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath)
            cell.selectionStyle = .none
            return cell
        case 3:
            cell = discussionTableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath)
            cell.selectionStyle = .none
            return cell
        case 4:
            cell = discussionTableView.dequeueReusableCell(withIdentifier: "cell5", for: indexPath)
            cell.selectionStyle = .none
            return cell
        case 5:
            cell = discussionTableView.dequeueReusableCell(withIdentifier: "cell6", for: indexPath)
            cell.selectionStyle = .none
            return cell
        default:
            cell = UITableViewCell()
            return cell
        }
    }
}
