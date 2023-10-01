//
//  LatestNewsTableViewCell.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 16.09.2023.
//

import UIKit

class LatestNewsTableViewCell: UITableViewCell {
    var imageSV = UIStackView()
    var imageArr = [UIImage]()
    var titleLabel = UILabel()
    var playerNameLable = UILabel()
    var teamNameLabel = UILabel()
    var dateStackView = UIStackView()
    var shareButton = UIButton()
    var descriptionLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .black.withAlphaComponent(0.87)
        
        imageSV.axis = .horizontal
        imageSV.alignment = .center
        imageSV.spacing = -20
        imageSV.distribution = .fill
        
        imageArr = [UIImage(named: "juventusLogoDesc") ?? UIImage(),
                    UIImage(named: "ronaldoAva") ?? UIImage()
        ]
        
        imageArr.forEach { image in
            let imageSize: CGFloat = 48
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFill
            imageView.widthAnchor.constraint(equalToConstant: imageSize).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: imageSize).isActive = true
            
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = imageSize / 2
            imageSV.addArrangedSubview(imageView)
        }
        
        contentView.addSubview(imageSV)
        
        imageSV.snp.makeConstraints {
            $0.top.left.equalTo(contentView).inset(8)
        }
        
        titleLabel.text = "Football news"
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(contentView).inset(8)
            $0.left.equalTo(imageSV.snp.right).inset(-16)
        }
        
        teamNameLabel.text = "Juventus, "
        teamNameLabel.textColor = .white
        teamNameLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        contentView.addSubview(teamNameLabel)
        
        teamNameLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel).inset(24)
            $0.left.equalTo(imageSV.snp.right).inset(-16)
        }
        
        playerNameLable.text = "Ronaldo"
        playerNameLable.textColor = .white
        playerNameLable.font = .systemFont(ofSize: 17, weight: .semibold)
        contentView.addSubview(playerNameLable)
        
        playerNameLable.snp.makeConstraints {
            $0.top.equalTo(titleLabel).inset(24)
            $0.left.equalTo(teamNameLabel.snp.right)
        }
        dateStackView.axis = .vertical
        dateStackView.spacing = 0
        let day = UILabel()
        day.text = "22"
        day.textColor = .white
        day.font = .systemFont(ofSize: 17, weight: .medium)
        
        let month = UILabel()
        month.text = "Oct"
        month.textColor = .gray
        month.font = .systemFont(ofSize: 17, weight: .medium)
        
        dateStackView.addArrangedSubview(day)
        dateStackView.addArrangedSubview(month)
        contentView.addSubview(dateStackView)

        dateStackView.snp.makeConstraints {
            $0.top.equalTo(imageSV.snp.bottom).inset(-16)
            $0.left.equalTo(contentView).inset(8)
        }
        
        descriptionLabel.text = "Ronaldo nominated for UEFA Men's.\nPlayer of the year"
        descriptionLabel.textColor = .white
        descriptionLabel.font = .systemFont(ofSize: 17, weight: .medium)
        descriptionLabel.numberOfLines = 0
        contentView.addSubview(descriptionLabel)
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(imageSV.snp.bottom).inset(-16)
            $0.left.equalTo(dateStackView.snp.right).inset(-24)
            $0.bottom.equalTo(contentView).inset(8)
        }
        shareButton.setImage(UIImage(named: "share"), for: .normal)
        contentView.addSubview(shareButton)
        
        shareButton.snp.makeConstraints {
            $0.top.equalTo(contentView).inset(8)
            $0.right.equalTo(contentView).inset(12)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//
//        }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
