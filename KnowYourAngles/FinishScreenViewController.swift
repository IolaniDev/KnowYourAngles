//
//  FinishScreenViewController.swift
//  KnowYourAngles
//
//  Created by Cart 115 Administrator on 7/8/16.
//  Copyright © 2016 Iolani School. All rights reserved.
//

import Foundation
import CoreData

public class FinishScreenViewController: UIViewController{
    
    // variables to hold info to display on Finish Screen
    var finalScore : Int = 0;
    var totalNum : Int = 0;
    var finalTime = (0,0);
    var isTimerOn = false;
    
    // references to UI components on storyboard
    @IBOutlet weak var finishScore: UILabel!
    @IBOutlet weak var finishTime: UILabel!
    
    // load previously saved settings (if there are any)
    private let savedSettings = NSUserDefaults.standardUserDefaults()
    
    // view did load
    override public func viewDidLoad() {
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
        
        // log results in high scores
        logResultsInHighScores();
    }
    
    // added functionality to a button component so the results after answering questions can be saved as a picture for sharing
    @IBAction func saveScreenshot(sender: UIButton) {
        UIGraphicsBeginImageContext(view.frame.size);
        view.layer.renderInContext(UIGraphicsGetCurrentContext()!);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    }
    
    // function to save the results in the High Score tables
    func logResultsInHighScores()
    {
        // get the managed object context
        let managedContext = DataController().managedObjectContext;
        
        // create a fetch request for all Table entities
        let fetchRequest = NSFetchRequest(entityName: "Table");
        
        //create the new High Score entry
        let score = NSEntityDescription.insertNewObjectForEntityForName("HighScore", inManagedObjectContext: managedContext)
        score.setValue(finalScore, forKey: "numCorrect")
        score.setValue(0, forKey: "timeLimitMin")
        score.setValue(0, forKey: "timeLimitSec")
        score.setValue(finalTime.0, forKey: "timeTakenMin")
        score.setValue(finalTime.1, forKey: "timeTakenSec")
        score.setValue(totalNum, forKey: "totalProblems")
        
        // set the category for the new score entry
        var categories = "";
        // include deg if the set of problems had degrees in them
        if(savedSettings.valueForKey("degrees") as! Bool)
        {
            categories += "deg"
        }
        // include rad if the set of problems had radians
        if(savedSettings.valueForKey("radians") as! Bool)
        {
            categories += "rad"
        }
        // include rec if the set of problems included reciprocals
        if(savedSettings.valueForKey("reciprocals") as! Bool)
        {
            categories += "rec"
        }
        
        // set the category for the High Score entry
        score.setValue(categories, forKey: "category");
        
        //if there was no time limit
        if(!isTimerOn)
        {
            categories = "highScores0"+categories;
        }
        //if the timer was on, then figure out how much time was allotted.
        else
        {
            //get the time allowed from saved settings
            let timeAllowed = (savedSettings.integerForKey("amtTimeMin"), savedSettings.integerForKey("amtTimeSec"));
            
            //if the time allowed was 30 seconds...
            if(timeAllowed.0 == 0 && timeAllowed.1 == 30)
            {
                categories = "highScores30" + categories;
            }
            //else if the time allowed was 1 minute or 1 minute 30 seconds
            else if(timeAllowed.0 == 1)
            {
                if(timeAllowed.1 == 0)
                {
                    categories = "highScores1" + categories;
                }
                else // if(timeAllowed.1 == 30)
                {
                    categories = "highScores130" + categories;
                }
            }
            //else if the time allowed was 2 minutes or 2 minutes 30 seconds
            else if(timeAllowed.0 == 2 && timeAllowed.1 == 0)
            {
                if(timeAllowed.1 == 0)
                {
                    categories = "highScores2" + categories;
                }
                else // if(timeAllowed.1 == 30)
                {
                    categories = "highScores230" + categories;
                }
            }
            //else if the time allowed was 3 minutes
            else
            {
                categories = "highScores3" + categories;
            }
        }
        //modify the fetch request to only include the Table with category highScores30
        fetchRequest.predicate = NSPredicate(format: "category = %@", categories)
        
        do{
            //run the fetch request and store the resulting Table in results
            let results = try managedContext.executeFetchRequest(fetchRequest);
            
            //if the table does not exist...
            if(results.count == 0)
            {
                //create a table
                let newTable = NSEntityDescription.insertNewObjectForEntityForName("Table", inManagedObjectContext: managedContext);
                newTable.setValue(categories, forKey: "category");
                (score as! HighScore).table = (newTable as! Table)
            }
            // if the table already exists...
            else{
                // get the table
                let tempTable = results[0] as! Table
                // add the new High Score into the records
                (score as! HighScore).table = tempTable
                if(tempTable.highScores?.count>5)
                {
                    managedContext.deleteObject(tempTable.highScores?.reversedOrderedSet.lastObject as! HighScore);
                }
            }
        }catch let error as NSError{
            print("Could not fetch \(error), \(error.userInfo)")
        }
        catch let e as NSException{
            print("\(e.userInfo)");
        }
        catch{
            print("You messed up.")
        }
        
        do{
            try managedContext.save();
            
        }catch let error as NSError{
            print("Could not save \(error), \(error.userInfo)")
        }
    }
}
