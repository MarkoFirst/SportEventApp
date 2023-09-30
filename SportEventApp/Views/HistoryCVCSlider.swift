//
//  HistoryCVCSlider.swift
//  SportEventApp
//
//  Created by Nikita Melnikov on 29.09.2023.
//

import Foundation
import UIKit
import SnapKit

class HistoryCVCSlider: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HistoryCVCSlider {
    
    func setupViews() {
        
        let view = UIView()
        view.backgroundColor = .blue
        contentView.addSubview(view)        
        
        view.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(2)
            $0.height.equalTo(4)
        }
    }
}

