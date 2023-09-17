//
//  RateTableViewCell.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 16.09.2023.
//

import UIKit
import DGCharts

class RateTableViewCell: UITableViewCell {
    let gamesLabel = UILabel()
    let gamesView = UIView()
    let gamesCount = UILabel()
    let gamesImage = UIImageView(image: UIImage(named: "sneaker"))
    let shortsOnTargetChar = PieChartView()
    let goalsScoredChar = PieChartView()
    var pieChartsSV = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .black.withAlphaComponent(0.87)
        
        shortsOnTargetChar.widthAnchor.constraint(equalToConstant: 100).isActive = true
        shortsOnTargetChar.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        let shortsOnTarget = "8"
        let attributes: [NSAttributedString.Key : Any] = [
            .font: UIFont.systemFont(ofSize: 15, weight: .heavy),
            .foregroundColor: UIColor.white
        ]
        shortsOnTargetChar.centerAttributedText = NSAttributedString(string: shortsOnTarget, attributes: attributes)
        shortsOnTargetChar.holeColor = #colorLiteral(red: 0.2736296058, green: 0.503644228, blue: 0.3158664107, alpha: 1)
        shortsOnTargetChar.legend.enabled = false
        shortsOnTargetChar.transparentCircleRadiusPercent = CGFloat(0.8)
        
        let dataEntries: [ChartDataEntry] = [
            PieChartDataEntry(value: 8),
            PieChartDataEntry(value: 14)
        ]
        
        let colors: [UIColor] = [#colorLiteral(red: 0.2736296058, green: 0.503644228, blue: 0.3158664107, alpha: 1), .clear]
        let dataSet = PieChartDataSet(entries: dataEntries)
        dataSet.drawValuesEnabled = false
        dataSet.colors = colors
        shortsOnTargetChar.transparentCircleColor = #colorLiteral(red: 0.1294117868, green: 0.1294117868, blue: 0.1294117868, alpha: 1)

        let data = PieChartData(dataSet: dataSet)
        shortsOnTargetChar.data = data
        
        contentView.addSubview(shortsOnTargetChar)

        let goalsScored = "6"
        
        goalsScoredChar.centerAttributedText = NSAttributedString(string: goalsScored, attributes: attributes)
        goalsScoredChar.holeColor = #colorLiteral(red: 0.2736296058, green: 0.503644228, blue: 0.3158664107, alpha: 1)
        goalsScoredChar.legend.enabled = false
        goalsScoredChar.transparentCircleRadiusPercent = CGFloat(0.8)
        
        goalsScoredChar.widthAnchor.constraint(equalToConstant: 100).isActive = true
        goalsScoredChar.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        let dataEntries1: [ChartDataEntry] = [
            PieChartDataEntry(value: 6),
            PieChartDataEntry(value: 8)
        ]
        
        let dataSet1 = PieChartDataSet(entries: dataEntries1)
        dataSet1.drawValuesEnabled = false
        dataSet1.colors = colors
        goalsScoredChar.transparentCircleColor = #colorLiteral(red: 0.1294117868, green: 0.1294117868, blue: 0.1294117868, alpha: 1)

        let data1 = PieChartData(dataSet: dataSet1)
        goalsScoredChar.data = data1
        
        contentView.addSubview(goalsScoredChar)
        contentView.addSubview(pieChartsSV)
        
        let shotsOnTargetSV = UIStackView()
        shotsOnTargetSV.axis = .vertical
        shotsOnTargetSV.spacing = -16
        
        let goalsScoredSV = UIStackView()
        goalsScoredSV.axis = .vertical
        goalsScoredSV.spacing = -16
        
        let shortsOnTargetLabel = UILabel()
        shortsOnTargetLabel.text = "Shots on\ntarget"
        shortsOnTargetLabel.textAlignment = .center
        shortsOnTargetLabel.numberOfLines = 2
        shortsOnTargetLabel.textColor = .gray
        shortsOnTargetLabel.font = .systemFont(ofSize: 15, weight: .medium)
        
        let goalsScoredLabel = UILabel()
        goalsScoredLabel.text = "Goals\nscored"
        goalsScoredLabel.textAlignment = .center
        goalsScoredLabel.numberOfLines = 2
        goalsScoredLabel.textColor = .gray
        goalsScoredLabel.font = .systemFont(ofSize: 15, weight: .medium)
        
        shotsOnTargetSV.addArrangedSubview(shortsOnTargetChar)
        shotsOnTargetSV.addArrangedSubview(shortsOnTargetLabel)
        
        goalsScoredSV.addArrangedSubview(goalsScoredChar)
        goalsScoredSV.addArrangedSubview(goalsScoredLabel)
        
        pieChartsSV.addArrangedSubview(shotsOnTargetSV)
        pieChartsSV.addArrangedSubview(goalsScoredSV)
        
        shortsOnTargetLabel.snp.makeConstraints {
            $0.top.equalTo(shortsOnTargetChar.snp.bottom)
            
        }
        
        goalsScoredLabel.snp.makeConstraints {
            $0.top.equalTo(goalsScoredChar.snp.bottom)
        }

        gamesLabel.text = "GAMES"
        gamesLabel.textColor = .white
        gamesLabel.font = .systemFont(ofSize: 17, weight: .heavy)
        
        contentView.addSubview(gamesLabel)
        
        gamesLabel.snp.makeConstraints {
            $0.top.left.equalTo(contentView).inset(16)
            
        }

        gamesView.backgroundColor = #colorLiteral(red: 0.2736296058, green: 0.503644228, blue: 0.3158664107, alpha: 1)
        gamesView.layer.masksToBounds = true
        gamesView.layer.cornerRadius = 10
        gamesView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        gamesView.widthAnchor.constraint(equalToConstant: 100).isActive = true

        contentView.addSubview(gamesView)
        contentView.addSubview(gamesImage)
        
        var gamesCountNum = 14
        gamesCount.text = String(gamesCountNum)
        gamesCount.textColor = .white
        gamesCount.font = .systemFont(ofSize: 25, weight: .heavy)
        contentView.addSubview(gamesCount)
        
        gamesView.snp.makeConstraints {
            $0.left.equalTo(contentView).inset(16)
            $0.top.equalTo(gamesLabel.snp.bottom).inset(-24)
        }
        
        gamesImage.snp.makeConstraints {
            $0.bottom.equalTo(gamesView)
            $0.left.equalTo(gamesView).inset(-17)
        }
        
        gamesCount.snp.makeConstraints {
            $0.top.right.equalTo(gamesView).inset(8)
           
        }
        pieChartsSV.snp.makeConstraints {
            $0.top.equalTo(gamesLabel.snp.bottom).inset(-8)
            $0.left.equalTo(gamesView.snp.right)
        }
        
        let desciplineSV = UIStackView()
        desciplineSV.axis = .horizontal
        desciplineSV.spacing = 8
        
        let smallView = UIView()
        smallView.backgroundColor = #colorLiteral(red: 0.2736296058, green: 0.503644228, blue: 0.3158664107, alpha: 1)
        smallView.layer.masksToBounds = true
        smallView.layer.cornerRadius = 4
        smallView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        smallView.widthAnchor.constraint(equalToConstant: 8).isActive = true
        desciplineSV.addArrangedSubview(smallView)

        let desciplineLabel = UILabel()
        desciplineLabel.text = "DISCIPLINE"
        desciplineLabel.textColor = .white
        desciplineLabel.font = .systemFont(ofSize: 17, weight: .heavy)
        desciplineSV.addArrangedSubview(desciplineLabel)

        contentView.addSubview(desciplineSV)
        
        desciplineSV.snp.makeConstraints {
            $0.top.equalTo(pieChartsSV.snp.bottom).inset(-24)
            $0.left.equalTo(contentView)
        }
        
        let disciplineCellsSV = UIStackView()
        disciplineCellsSV.axis = .horizontal
        disciplineCellsSV.alignment = .center
        
        let foulsWonNumber = 8
        
        let foulsWonNumberLabel = UILabel()
        foulsWonNumberLabel.text = String(foulsWonNumber)
        foulsWonNumberLabel.textAlignment = .center
        foulsWonNumberLabel.textColor = .white
        foulsWonNumberLabel.font = .systemFont(ofSize: 25, weight: .heavy)
        
        let foulsWonTitle = UILabel()
        foulsWonTitle.numberOfLines = 2
        foulsWonTitle.text = "Fouls\nwon"
        foulsWonTitle.textAlignment = .center
        foulsWonTitle.textColor = .gray
        foulsWonTitle.font = .systemFont(ofSize: 15, weight: .medium)
        let foulsWonSV = UIStackView()
        foulsWonSV.axis = .vertical
        
        foulsWonSV.addArrangedSubview(foulsWonNumberLabel)
        foulsWonSV.addArrangedSubview(foulsWonTitle)
        
        disciplineCellsSV.addArrangedSubview(foulsWonSV)
        
        let foulsConcededSV = UIStackView()
        foulsConcededSV.axis = .vertical
        
        let foulsConcededNumber = 3
        let foulsConcededNumberLabel = UILabel()
        foulsConcededNumberLabel.text = String(foulsConcededNumber)
        foulsConcededNumberLabel.textColor = .white
        foulsConcededNumberLabel.font = .systemFont(ofSize: 25, weight: .heavy)
        foulsConcededNumberLabel.textAlignment = .center
        
        let foulsConcededTitle = UILabel()
        foulsConcededTitle.text = "Fouls\nconceded"
        foulsConcededTitle.textAlignment = .center
        foulsConcededTitle.numberOfLines = 2
        foulsConcededTitle.textColor = .gray
        foulsConcededTitle.font = .systemFont(ofSize: 15, weight: .medium)
        
        foulsConcededSV.addArrangedSubview(foulsConcededNumberLabel)
        foulsConcededSV.addArrangedSubview(foulsConcededTitle)
        disciplineCellsSV.addArrangedSubview(foulsConcededSV)
        
        let mainYellowCardSV = UIStackView()
        mainYellowCardSV.axis = .vertical
        mainYellowCardSV.backgroundColor = .clear
        
        let yellowCardNumber = 3
        let yellowCardNumberLabel = UILabel()
        yellowCardNumberLabel.text = String(yellowCardNumber)
        yellowCardNumberLabel.textColor = .white
        yellowCardNumberLabel.font = .systemFont(ofSize: 25, weight: .heavy)
        
        let yellowCardNumberImage = UIImageView(image: UIImage(named: "yellow"))

        let yellowCardView = UIView()
        yellowCardView.backgroundColor = .clear

        yellowCardView.addSubview(yellowCardNumberLabel)
        yellowCardView.addSubview(yellowCardNumberImage)
        
        yellowCardNumberLabel.snp.makeConstraints {
            $0.right.equalTo(yellowCardView.snp.centerX)
            $0.centerY.equalTo(yellowCardView.snp.centerY)
        }
        
        yellowCardNumberImage.snp.makeConstraints {
            $0.height.width.equalTo(20)
            $0.left.equalTo(yellowCardNumberLabel.snp.right)
            $0.centerY.equalTo(yellowCardView.snp.centerY)
        }

        mainYellowCardSV.addArrangedSubview(yellowCardView)
        
        yellowCardView.snp.makeConstraints {
            $0.width.equalTo(mainYellowCardSV.snp.width)
            $0.height.equalTo(30)
            
        }
       
        let yellowCardsTitle = UILabel()
        yellowCardsTitle.text = "Yellow\ncards"
        yellowCardsTitle.textColor = .gray
        yellowCardsTitle.font = .systemFont(ofSize: 15, weight: .medium)
        yellowCardsTitle.numberOfLines = 2
        yellowCardsTitle.textAlignment = .center
        mainYellowCardSV.addArrangedSubview(yellowCardsTitle)
        disciplineCellsSV.addArrangedSubview(mainYellowCardSV)

        let mainRedCardSV = UIStackView()
        mainRedCardSV.axis = .vertical
        mainRedCardSV.backgroundColor = .clear
        
        let redCardNumber = 1
        let redCardNumberLabel = UILabel()
        redCardNumberLabel.text = String(redCardNumber)
        redCardNumberLabel.textColor = .white
        redCardNumberLabel.font = .systemFont(ofSize: 25, weight: .heavy)
        
        let redCardNumberImage = UIImageView(image: UIImage(named: "red"))

        let redCardView = UIView()
        redCardView.backgroundColor = .clear

        redCardView.addSubview(redCardNumberLabel)
        redCardView.addSubview(redCardNumberImage)
        
        redCardNumberLabel.snp.makeConstraints {
            $0.right.equalTo(redCardView.snp.centerX)
            $0.centerY.equalTo(redCardView.snp.centerY)
        }
        
        redCardNumberImage.snp.makeConstraints {
            $0.height.width.equalTo(20)
            $0.left.equalTo(redCardNumberLabel.snp.right)
            $0.centerY.equalTo(redCardView.snp.centerY)
        }

        mainRedCardSV.addArrangedSubview(redCardView)
        
        redCardView.snp.makeConstraints {
            $0.width.equalTo(mainRedCardSV.snp.width)
            $0.height.equalTo(30)
            
        }
        
        let redCardsTitle = UILabel()
        redCardsTitle.text = "Red\ncards"
        redCardsTitle.textColor = .gray
        redCardsTitle.font = .systemFont(ofSize: 15, weight: .medium)
        redCardsTitle.numberOfLines = 2
        redCardsTitle.textAlignment = .center
        mainRedCardSV.addArrangedSubview(redCardsTitle)
        disciplineCellsSV.addArrangedSubview(mainRedCardSV)
        
        
        
        
        
        
        contentView.addSubview(disciplineCellsSV)
        
        disciplineCellsSV.snp.makeConstraints {
            $0.top.equalTo(desciplineSV.snp.bottom).inset(-16)
            $0.left.right.equalTo(contentView).inset(16)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



/*
 override func awakeFromNib() {
     super.awakeFromNib()
     // Initialization code
 }

 override func setSelected(_ selected: Bool, animated: Bool) {
     super.setSelected(selected, animated: animated)

     // Configure the view for the selected state
 }

 
 
 
 
 

 yellowCardView.addSubview(yellowCardNumberLabel)
 
 yellowCardNumberLabel.snp.makeConstraints {
     $0.left.equalTo(yellowCardView)
     $0.centerY.equalTo(yellowCardView.snp.centerY)
 }
 
 yellowCardView.addSubview(yellowCardNumberImage)

 yellowCardNumberImage.snp.makeConstraints {
     $0.left.equalTo(yellowCardNumberLabel.snp.right)
     $0.centerY.equalTo(yellowCardView.snp.centerY)
     $0.height.width.equalTo(25)
 }
 
 mainYellowCardSV.addArrangedSubview(yellowCardView)
 */
