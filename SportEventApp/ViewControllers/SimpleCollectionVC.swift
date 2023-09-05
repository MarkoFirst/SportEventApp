//
//  SimpleCollectionVC.swift
//  SportEventApp
//
//  Created by MF-Citrus on 31.08.2023.
//

import Foundation
import UIKit

class SimpleCollectionVC: UICollectionViewController {
    
    private let refreshControl: UIRefreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: 200, height: 500)
//        layout.scrollDirection = .horizontal
//        layout.minimumInteritemSpacing = 100
//
//        let collectionView = UICollectionView(
//            frame: CGRect(x: 0, y: 0, width: 100, height: 100),
//            collectionViewLayout: layout
//        )
//
//        collectionView.collectionViewLayout = layout
        
        refreshControl.addTarget(self, action: #selector(poolToRefresh), for: .valueChanged)
        collectionView.addSubview(refreshControl)
        
        refreshControl.tintColor = .systemPink
        refreshControl.attributedTitle = NSMutableAttributedString(string: "some")
        
        navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "image 4.pdf")
    }
    
    @objc
    private func poolToRefresh() {
        print(#function)
        refreshControl.endRefreshing()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let id: String
        
        switch indexPath.section {
        case 0:
            id = "redCell"
        case 1:
            id = "yellowCell"
        case 2:
            id = "redCell"
        case 3:
            id = "blueCell"
        default:
            id = "redCell"
        }
        
        return collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}






extension SimpleCollectionVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: 100, height: 100)
        case 1:
            return CGSize(width: 250, height: 100)
        case 3:
            return CGSize(width: 600, height: 400)
        default:
            return CGSize(width: 200, height: 100)
        }
    }
}



extension Int {
    func random() -> Int {
        return Int.random(in: 0..<self)
    }
}
