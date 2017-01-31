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
    let sectionInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0);
    let itemsPerRow: CGFloat = 4;
    var summaryData : [UIImage] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return summaryData.count;
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! SummaryCell;
        cell.backgroundColor = UIColor.whiteColor();
        cell.imageView.image = summaryData[indexPath.item];
        return cell;
    }
}

extension SummaryCollectionViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        /*let paddingSpace = sectionInsets.left * (itemsPerRow+1)
        NSLog("paddingSpace: %f", paddingSpace);
        let availableWidth = view.frame.width - paddingSpace
        NSLog("availableWidth: %f", availableWidth);
        let widthPerItem = availableWidth / itemsPerRow
        NSLog("widthPerItem: %f", widthPerItem);*/
        //return CGSize(width: widthPerItem, height: widthPerItem);
        return CGSize(width: 121.75, height: 121.75);
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return sectionInsets;
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return sectionInsets.left;
    }
}