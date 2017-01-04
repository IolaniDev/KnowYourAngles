//
//  HighScoreViewController.swift
//  KnowYourAngles
//
//  Created by iPad App Dev on 12/21/16.
//  Copyright © 2016 Iolani School. All rights reserved.
//

import Foundation
import CoreData

class HighScoreViewController : UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    // possible readable categories user can select to see "best scores" for those times
    var timeCategories = ["No Time Limit", "30 seconds", "1 minute", "1 minute 30 seconds", "2 minutes", "2 minutes 30 seconds", "3 minutes"];
    
    // possible categories used to request entries from the Data Model
    var times = ["highScores0", "highScores30", "highScores1", "highScores130", "highScores2", "highScores230", "highScores3"];
    
    // possible sets of problems user can select to see "best scores for those types of problems
    var problemCategories = ["degrees", "radians", "degrees & radians", "reciprocals (deg)", "reciprocals (rad)", "reciprocals (deg & rad)"];
    
    // possible types of problems to request entries from the Data Model
    var problems = ["deg", "rad", "degrad", "degrec", "radrec", "degradrec"];
    
    // current category displayed (set to "No Time Limit" by default)
    var currCategory = "highScores0deg";
    
    var tempTimeCategory = "highScores0";
    var tempProbCategory = "deg";
    
    // references to the picker view and table view UI components on the storyboard
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var tableView: UITableView!
    
    // 2 components in the picker (one for time limit and one for type of problems)
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2;
    }
    
    // should have one row per category in the picker
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(component == 0)
        {
            return timeCategories.count;
        }
        else
        {
            return problemCategories.count;
        }
    }
    
    // get labels for picker from the timeCategories array
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(component == 0)
        {
            return timeCategories[row];
        }
        else
        {
            return problemCategories[row];
        }
    }
    
    // format each row of the picker
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        var pickerLabel = view as? UILabel;
        //if the picker label hasn't been created yet, set the font of the labels
        if(pickerLabel == nil)
        {
            pickerLabel = UILabel();
            pickerLabel?.font = UIFont(name: "Times New Roman", size: 36);
            pickerLabel?.textColor = UIColor(red: 40/255, green: 204/255, blue: 198/255, alpha: 1);
            pickerLabel?.textAlignment = NSTextAlignment.Center;
        }
        // if we're setting up the view for the first component (the time limit)
        if(component == 0)
        {
            pickerLabel?.text = timeCategories[row];
        }
        // if we're setting up the view for the second component (type of problems)
        else
        {
            pickerLabel?.text = problemCategories[row];
        }
        return pickerLabel!;
    }
    
    // set each row in the picker to have a height of 40
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40;
    }
    
    // use the picker to select which table of high scores to display
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // if we're looking at the first component (time limit)
        if(component == 0)
        {
            tempTimeCategory = times[row];
        }
        else
        {
            tempProbCategory = problems[row];
        }
        
        currCategory = tempTimeCategory + tempProbCategory;
        tableView.reloadData();
    }
    
    //a functioning table view requires the following three table view data source methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let managedContext = DataController().managedObjectContext;
        let fetchRequest = NSFetchRequest(entityName: "Table");
        fetchRequest.predicate = NSPredicate(format: "category = %@", currCategory);
        
        do{
            let results = try managedContext.executeFetchRequest(fetchRequest)
            if(results.count == 0)
            {
                return 0;
            }
            var scores = results as! [NSManagedObject]
            print(scores[0] as! Table);
            if(scores.count == 0)
            {
                return 0;
            }
            else{
                return ((scores[0] as! Table).highScores?.count)!;
            }
        }catch let error as NSError{
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        return 5;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "HighScoreCell";
        guard let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as? HighScoreTableViewCell else{
            fatalError("The dequeued cell is not an instance of HighScoreTableViewCell");
        }
        
        //configure the cell
        cell.backgroundColor = UIColor(red: 25/255, green: 127/255, blue: 124/255, alpha: 1);
        
        let managedContext = DataController().managedObjectContext;
        let fetchRequest = NSFetchRequest(entityName: "Table");
        //"No Time Limit", "30 seconds", "1 minute", "1 minute 30 seconds", "2 minutes", "2 minutes 30 seconds", "3 minutes"
        //"degrees", "radians", "degrees & radians", "reciprocals (deg)", "reciprocals (rad)", "reciprocals (deg & rad)"
        fetchRequest.predicate = NSPredicate(format: "category = %@", currCategory);
        do{
            let results = try managedContext.executeFetchRequest(fetchRequest)
            var scores = results as! [NSManagedObject]
            //print(scores[0] as! Table);
            let temp = (scores[0] as! Table).highScores?.reversedOrderedSet.objectAtIndex(indexPath.row) as! HighScore;
            let correct : Int = temp.valueForKey("numCorrect") as! Int;
            let total : Int = temp.valueForKey("totalProblems") as! Int;
            let minutes : Int = temp.valueForKey("timeTakenMin") as! Int;
            let seconds : Int = temp.valueForKey("timeTakenSec") as! Int;
            if(currCategory.containsString("highScores0"))
            {
                cell.highScoreEntry.text = "\(correct) correct out of \(total) problems";
                //cell.highScoreEntry.text = String(temp);
            }
            else
            {
                if(minutes == 0)
                {
                    cell.highScoreEntry.text = "\(correct) correct out of \(total) problems in \(seconds) seconds"
                }
                else if (seconds == 0)
                {
                    cell.highScoreEntry.text = "\(correct) correct out of \(total) problems in \(minutes) minutes"
                }
                else
                {
                    cell.highScoreEntry.text = "\(correct) correct out of \(total) problems in \(minutes) minutes \(seconds) seconds";
                }
            }
        }catch let error as NSError{
            print("Could not fetch \(error), \(error.userInfo)")
        }
        cell.highScoreEntry.backgroundColor = UIColor(red: 25/255, green: 127/255, blue: 124/255, alpha: 1);
        
        return cell;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.tableView.backgroundColor = UIColor(red: 25/255, green: 127/255, blue: 124/255, alpha: 1);
        
        self.tableView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
        
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
        
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        
        tableView.reloadData();
    }
}