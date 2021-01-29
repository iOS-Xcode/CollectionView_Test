//
//  SecondCollectionReusableView.swift
//  CollectionView_Test
//
//  Created by Seokhyun Kim on 2021-01-28.
//

import UIKit

class SecondCollectionReusableView: UICollectionReusableView {
    override init(frame: CGRect) {
       super.init(frame: frame)
        self.backgroundColor = UIColor(hex: "#F7F7F7FF")
        let widthCell = UIScreen.main.bounds.size.width
        let races = UILabel(frame: CGRect(x: 10, y: 5, width: widthCell / 3.5, height: 20))
        races.text = "Virtual Races"
        races.backgroundColor = .clear
        races.textAlignment = .center
        races.textColor = UIColor(hex: "#333333FF")
        races.font = UIFont.boldSystemFont(ofSize: 14)
        self.addSubview(races)
    }
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)

    }
}
