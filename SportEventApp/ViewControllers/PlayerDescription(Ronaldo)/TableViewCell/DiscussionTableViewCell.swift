//
//  DiscussionTableViewCell.swift
//  SportEventApp
//
//  Created by Дима Самойленко on 28.09.2023.
//

import UIKit

class DiscussionTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {

        let discussingSVArr: [(UIImageView, UILabel, UIView)] = [(UIImageView(), UILabel(), UIView())]
        var humanArr = [UIImage]() //array of people images
        
        let discussingSV = UIStackView(arrangedSubviews: discussingSVArr.map({ (imageView, label, view) in
            
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
            
            let peopleSv = UIStackView() // stackview of people images
            peopleSv.axis = .horizontal
            peopleSv.alignment = .center
            peopleSv.spacing = -20
            peopleSv.distribution = .fill
            
            humanArr.forEach { image in
                let imageView = UIImageView(image: image)
                imageView.contentMode = .scaleAspectFit
                imageView.widthAnchor.constraint(equalToConstant: 36).isActive = true
                peopleSv.addArrangedSubview(imageView)
                view.addSubview(peopleSv)
            }
            
            viewInSV.addSubview(label)
            viewInSV.addSubview(imageView)
            viewInSV.addSubview(view)
            
            
            peopleSv.snp.makeConstraints {
                $0.left.right.top.bottom.equalTo(view)
            }
            
            
            viewInSV.snp.makeConstraints {
                $0.height.equalTo(30)
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

        contentView.addSubview(discussingSV)
        
        discussingSV.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

