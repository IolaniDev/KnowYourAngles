//
//  FinishScreenViewController.swift
//  KnowYourAngles
//
//  Created by Cart 115 Administrator on 7/8/16.
//  Copyright © 2016 Iolani School. All rights reserved.
//

import Foundation
import CoreData
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


open class FinishScreenViewController: UIViewController{
    
    // variables to hold info to display on Finish Screen
    var finalScore : Int = 0;
    var totalNum : Int = 0;
    var finalTime = (0,0);
    var isTimerOn = false;
    //original problem, correct answer, what user answered, correct or wrong
    //var summaryData : [(UIImage,UIImage,UIImage,UIImage)]=[];
    var summaryData : [UIImage] = [];
    
    //let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0);
    //let itemsPerRow: CGFloat = 3;
    
    // references to UI components on storyboard
    @IBOutlet weak var finishScore: UILabel!
    @IBOutlet weak var finishTime: UILabel!
    //@IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var summaryView: UICollectionView!
    
    
    // load previously saved settings (if there are any)
    fileprivate let savedSettings = UserDefaults.standard
    
    // view did load
    override open func viewDidLoad() {
        super.viewDidLoad();
        let mainController = SummaryCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        //let navigationController = UINavigationController(rootViewController: mainController)
        self.addChildViewController(mainController);
        
        //viewControllers = [navigationController]
        mainController.summaryData = self.summaryData;
        // set the score results
        finishScore.text = "Score: \(finalScore) out of \(totalNum)";
        
        // if the timer was on, then output the time it took to answer all of the questions
        if (isTimerOn)
        {
            // output the time used to answer the questions
            finishTime.text = String(format: "Time: %02d:%02d", finalTime.0, finalTime.1);
        }
        // otherwise don't display anything about the time
        else
        {
            finishTime.text = "";
        }
        
        summaryView.dataSource = mainController;
        summaryView.delegate = mainController;
    }
    
    // added functionality to a button component so the results after answering questions can be saved as a picture for sharing
    @IBAction func saveScreenshot(_ sender: UIButton) {
        UIGraphicsBeginImageContext(view.frame.size);
        view.layer.render(in: UIGraphicsGetCurrentContext()!);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil);
    }
}
