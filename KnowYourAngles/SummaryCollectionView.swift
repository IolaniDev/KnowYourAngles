//
//  SummaryCollectionView.swift
//  KnowYourAngles
//
//  Created by iPad App Dev on 1/30/17.
//  Copyright © 2017 Iolani School. All rights reserved.
//

import Foundation

class SummaryCollectionView : UICollectionView{
    
    override func layoutSubviews() {
        super.layoutSubviews()
        (collectionViewLayout as? UICollectionViewFlowLayout)?.sectionHeadersPinToVisibleBounds = true;
//        let location = CGPointMake(0, contentOffset.y)
//        let size = header.frame.size
//        
//        header.frame = CGRect(origin: location, size: size)
    }
}