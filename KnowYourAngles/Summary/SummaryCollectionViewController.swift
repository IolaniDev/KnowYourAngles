//
//  SummaryCollectionViewController.swift
//  KnowYourAngles
//
//  Created by iPad App Dev on 1/30/17.
//  Copyright © 2017 Iolani School. All rights reserved.
//

import Foundation

class SummaryCollectionViewController : UICollectionViewController{
    let reuseIdentifier = "trigPic";
    let sectionInsets = UIEdgeInsets(top: 10.0, left: 0.0, bottom: 0.0, right: 0.0);
    let itemsPerRow: CGFloat = 4;
    var summaryData : [UIImage] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return summaryData.count;
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SummaryCell;
        cell.backgroundColor = UIColor.white;
        cell.imageView.image = summaryData[indexPath.item];
        return cell;
    }
}

extension SummaryCollectionViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150);
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left;
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind{
        case UICollectionElementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "summaryHeader", for: indexPath) as! SummaryHeaderView;
            headerView.backgroundColor = UIColor.white;
            headerView.problemImg = UIImageView(image: UIImage(named: "problem"));
            headerView.correctAnswerImg = UIImageView(image: UIImage(named: "correctAnswer"));
            headerView.yourAnswerImg = UIImageView(image: UIImage(named: "yourAnswer"));
            headerView.rightOrWrongImg = UIImageView(image: UIImage(named: "rightOrWrong"));
            return headerView;
        default:
            assert(false, "Unexpected element kind")
            return UICollectionReusableView();
        }
    }
}
