//
//  TrophiesCVC.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 26.09.2023.
//

import Foundation
import UIKit
import SnapKit

class TrophiesCVC: UICollectionViewCell {
   
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        
        let view = UIView()
        view.backgroundColor = .green
        contentView.addSubview(view)
        view.snp.makeConstraints{
            $0.height.equalTo(100)
//            $0.width.equalTo(50)
            $0.width.equalTo(view.snp.height).multipliedBy(1)
            $0.edges.equalToSuperview().inset(0)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
