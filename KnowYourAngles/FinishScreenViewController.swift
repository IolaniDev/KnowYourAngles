//
//  FinishScreenViewController.swift
//  KnowYourAngles
//
//  Created by Cart 115 Administrator on 7/8/16.
//  Copyright © 2016 Iolani School. All rights reserved.
//

import Foundation
import CoreData

open class FinishScreenViewController: UIViewController{
    
    // variables to hold info to display on Finish Screen
    var finalScore : Int = 0;
    var totalNum : Int = 0;
    var finalTime = (0,0);
    var isTimerOn = false;
    //original problem, correct answer, what user answered, correct or wrong
    var summaryData : [UIImage] = [];
    
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
        self.addChild(mainController);
        
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
    
    //reference to Score and Time Vertical Stack View
    @IBOutlet weak var scoreAndTimeView: UIStackView!
    
    // added functionality to a button component so the results after answering questions can be saved as a picture for sharing
    @IBAction func saveScreenshot(_ sender: UIButton) {
        UIGraphicsBeginImageContext(CGSize(width: summaryView.contentSize.width, height: summaryView.contentSize.height+250)); //UIGraphicsBeginImageContext(summaryView.contentSize);
        
        //grabs the score and time
        scoreAndTimeView.layer.render(in: UIGraphicsGetCurrentContext()!);
        
        //code based on https://stackoverflow.com/questions/41920416/how-to-make-a-screenshot-of-all-the-content-of-a-scrollview/41921091
        let savedContentOffset = summaryView.contentOffset
        let savedFrame = summaryView.frame
        
        summaryView.contentOffset = CGPoint.zero
        summaryView.frame = CGRect(x: 0, y: 0, width: summaryView.contentSize.width, height: summaryView.contentSize.height)
        
        summaryView.drawHierarchy(in: CGRect(x: 0, y: scoreAndTimeView.frame.height, width: summaryView.contentSize.width, height: summaryView.contentSize.height), afterScreenUpdates: true);

        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        summaryView.contentOffset = savedContentOffset
        summaryView.frame = savedFrame
        
        UIGraphicsEndImageContext()

        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil);
    }
}
