//
//  RateTableViewCell.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 16.09.2023.
//

import UIKit
import DGCharts

class RateTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .black.withAlphaComponent(0.87)
        
        let pie1 = createPieChar(doneNum: 8, totalNum: 14, labelText: "Shots on\ntarget")
        let pie2 = createPieChar(doneNum: 6, totalNum: 8, labelText: "Goals\nscored")

        let pieChartsSV = UIStackView()
        pieChartsSV.addArrangedSubview(pie1)
        pieChartsSV.addArrangedSubview(pie2)

        contentView.addSubview(pieChartsSV)

        let gamesLabel = UILabel()
        gamesLabel.text = "GAMES"
        gamesLabel.textColor = .white
        gamesLabel.font = .systemFont(ofSize: 17, weight: .heavy)
        
        contentView.addSubview(gamesLabel)
        
        gamesLabel.snp.makeConstraints {
            $0.top.left.equalTo(contentView).inset(16)
        }
        
        let gamesImage = UIImageView(image: UIImage(named: "sneaker"))
        let gamesView = UIView()
        gamesView.backgroundColor = #colorLiteral(red: 0.2736296058, green: 0.503644228, blue: 0.3158664107, alpha: 1)
        gamesView.layer.masksToBounds = true
        gamesView.layer.cornerRadius = 10
        gamesView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        gamesView.widthAnchor.constraint(equalToConstant: 100).isActive = true

        contentView.addSubview(gamesView)
        contentView.addSubview(gamesImage)
        
        let gamesCountNum = 14
        let gamesCount = UILabel()
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
            $0.centerX.equalTo(contentView.snp.centerX).multipliedBy(1.3)
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

        contentView.addSubview(disciplineCellsSV)
        
        disciplineCellsSV.snp.makeConstraints {
            $0.top.equalTo(desciplineSV.snp.bottom).inset(-16)
            $0.left.right.equalTo(contentView).inset(16)
            $0.bottom.equalTo(contentView).inset(8)
        }
        
        let firstDiscipline = createDisciplineData(description: "Fouls\nWon", times: 8, image: nil)
        let secondDiscipline = createDisciplineData(description: "Fouls\nconceded", times: 3, image: nil)
        let thirdDiscipline = createDisciplineData(description: "Yellow\ncards", times: 3, image: UIImage(named: "yellow"))
        let fourthDiscipline = createDisciplineData(description: "Red\ncards", times: 1, image: UIImage(named: "red"))

        disciplineCellsSV.addArrangedSubview(firstDiscipline)
        disciplineCellsSV.addArrangedSubview(secondDiscipline)
        disciplineCellsSV.addArrangedSubview(thirdDiscipline)
        disciplineCellsSV.addArrangedSubview(fourthDiscipline)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RateTableViewCell {
    func createPieChar(doneNum: Int, totalNum: Int, labelText: String) -> UIStackView {
        
        let pieChartSvWithDesc = UIStackView()
        pieChartSvWithDesc.axis = .vertical
        pieChartSvWithDesc.spacing = -16
        
        let pieChart = PieChartView()
        pieChart.widthAnchor.constraint(equalToConstant: 100).isActive = true
        pieChart.heightAnchor.constraint(equalToConstant: 100).isActive = true

        let chartDoneLabel = String(doneNum)
        let attributes: [NSAttributedString.Key : Any] = [
            .font: UIFont.systemFont(ofSize: 15, weight: .heavy),
            .foregroundColor: UIColor.white
        ]

        let chartDescription = UILabel()
        chartDescription.text = labelText
        chartDescription.textAlignment = .center
        chartDescription.numberOfLines = 2
        chartDescription.textColor = .gray
        chartDescription.font = .systemFont(ofSize: 15, weight: .medium)
        
        pieChart.centerAttributedText = NSAttributedString(string: chartDoneLabel, attributes: attributes)
        pieChart.holeColor = #colorLiteral(red: 0.2736296058, green: 0.503644228, blue: 0.3158664107, alpha: 1)
        pieChart.legend.enabled = false
        pieChart.transparentCircleRadiusPercent = CGFloat(0.8)

        let dataEntries: [ChartDataEntry] = [
            PieChartDataEntry(value: Double(doneNum)),
            PieChartDataEntry(value: Double(totalNum))
        ]

        let colors: [UIColor] = [#colorLiteral(red: 0.2736296058, green: 0.503644228, blue: 0.3158664107, alpha: 1), .clear]
        let dataSet = PieChartDataSet(entries: dataEntries)
        dataSet.drawValuesEnabled = false
        dataSet.colors = colors
        pieChart.transparentCircleColor = #colorLiteral(red: 0.1294117868, green: 0.1294117868, blue: 0.1294117868, alpha: 1)

        let data = PieChartData(dataSet: dataSet)
        pieChart.data = data
        pieChartSvWithDesc.addArrangedSubview(pieChart)
        pieChartSvWithDesc.addArrangedSubview(chartDescription)

        return pieChartSvWithDesc
    }
    
    func createDisciplineData(description: String, times: Int, image: UIImage?) -> UIStackView {
        let mainSV = UIStackView()
        mainSV.axis = .vertical
        mainSV.backgroundColor = .clear
        
        let numberOfFouls = times
        let numberOfFoulsLabel = UILabel()
        numberOfFoulsLabel.text = String(numberOfFouls)
        numberOfFoulsLabel.textColor = .white
        numberOfFoulsLabel.font = .systemFont(ofSize: 25, weight: .heavy)
        
        let cardImage = UIImageView(image: image ?? UIImage())

        let cardView = UIView()
        cardView.backgroundColor = .clear

        cardView.addSubview(numberOfFoulsLabel)
        cardView.addSubview(cardImage)
        
        if image != nil {
            numberOfFoulsLabel.snp.makeConstraints {
                $0.right.equalTo(cardView.snp.centerX)
                $0.centerY.equalTo(cardView.snp.centerY)
            }
        } else {
            numberOfFoulsLabel.snp.makeConstraints {
                $0.center.equalTo(cardView.snp.center)
            }
        }
        
        cardImage.snp.makeConstraints {
            $0.height.width.equalTo(20)
            $0.left.equalTo(numberOfFoulsLabel.snp.right)
            $0.centerY.equalTo(cardView.snp.centerY)
        }

        mainSV.addArrangedSubview(cardView)
        
        cardView.snp.makeConstraints {
            $0.width.equalTo(mainSV.snp.width)
            $0.height.equalTo(30)
        }
        
        let descriptionOfFoul = UILabel()
        descriptionOfFoul.text = description
        descriptionOfFoul.textColor = .gray
        descriptionOfFoul.font = .systemFont(ofSize: 15, weight: .medium)
        descriptionOfFoul.numberOfLines = 2
        descriptionOfFoul.textAlignment = .center
        mainSV.addArrangedSubview(descriptionOfFoul)
        
        return mainSV
    }
}
