//
//  HeaderCollectionReusableView.swift
//  CollectionView_Test
//
//  Created by Seokhyun Kim on 2021-01-28.
//

import UIKit

class FirstCollectionReusableView: UICollectionReusableView {
    override init(frame: CGRect) {
       super.init(frame: frame)
        self.backgroundColor = UIColor(hex: "#F7F7F7FF")
        let widthCell = UIScreen.main.bounds.size.width
        
        //records title of cell
        let records = UILabel(frame: CGRect(x: 10, y: self.center.y - 10, width: widthCell / 3, height: 20))
        records.textAlignment = .center
        records.text = "Personal Records"
        records.backgroundColor = UIColor.clear
        records.textColor = UIColor(hex: "#333333FF")
        records.font = UIFont.boldSystemFont(ofSize: 14)
        self.addSubview(records)
        
        //count title of cell
        let count = UILabel(frame: CGRect(x: self.frame.maxX - 70, y: self.center.y - 10, width: widthCell / 6, height: 20))
        count.textAlignment = .center
        count.text = "4 of 6"
        count.backgroundColor = UIColor.clear
        count.textColor = UIColor(hex: "#666666FF")
        count.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(count)

    }
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)

    }
}
