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
    
    // possible categories user can select to see "best scores" for those times
    var timeCategories = ["No Time Limit", "30 seconds", "1 minute", "1 minute 30 seconds", "2 minutes", "2 minutes 30 seconds", "3 minutes"];
    
    // current category displayed (set to "No Time Limit" by default)
    var currCategory = "No Time Limit";
    
    // references to the picker view and table view UI components on the storyboard
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var tableView: UITableView!
    
    // 1 component in the picker
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    // should have one row per category in the picker
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return timeCategories.count;
    }
    
    // get labels for picker from the timeCategories array
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return timeCategories[row];
    }
    
    // format each row of the picker
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        var pickerLabel = view as? UILabel;
        if(pickerLabel == nil)
        {
            pickerLabel = UILabel();
            pickerLabel?.font = UIFont(name: "Times New Roman", size: 36);
            pickerLabel?.textColor = UIColor(red: 40/255, green: 204/255, blue: 198/255, alpha: 1);
            pickerLabel?.textAlignment = NSTextAlignment.Center;
        }
        pickerLabel?.text = timeCategories[row];
        return pickerLabel!;
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if(row == 0)
        {
            let managedContext = DataController().managedObjectContext;
            let fetchRequest = NSFetchRequest(entityName: "Table");
            fetchRequest.predicate = NSPredicate(format: "category = %@", "highScores0");
            do{
                let results = try managedContext.executeFetchRequest(fetchRequest)
                let scores = results as! [NSManagedObject]
            }catch let error as NSError{
                print("Could not fetch \(error), \(error.userInfo)")
            }
        }
        else if(row == 1)
        {
            //highScores = savedSettings.objectForKey("highScores30") as! [HighScore];
            //highScores = [HighScore(limit: (0,30),time: (0,30),total: 10,correct: 1), HighScore(limit: (0,30),time: (0,28),total: 10,correct: 2), HighScore(limit: (0,30),time: (0,15),total: 10, correct: 10), HighScore(limit: (0,30),time: (0,10),total: 10,correct: 6), HighScore(limit: (0,30),time: (0,25),total: 20,correct: 10)];
        }
        else if(row == 2)
        {
            //highScores = savedSettings.objectForKey("highScores1") as! [HighScore];
            //highScores = [HighScore(limit: (1,0),time: (0,30),total: 10,correct: 1), HighScore(limit: (1,0),time: (0,28),total: 10,correct: 2), HighScore(limit: (1,0),time: (1,13),total: 10, correct: 10), HighScore(limit: (1,0),time: (0,10),total: 10,correct: 6), HighScore(limit: (1,0),time: (0,25),total: 20,correct: 10)];
        }
        else if(row == 3)
        {
            //highScores = savedSettings.objectForKey("highScores130") as! [HighScore];
            //highScores = [HighScore(limit: (1,30),time: (0,30),total: 10,correct: 1), HighScore(limit: (1,30),time: (0,28),total: 10,correct: 2), HighScore(limit: (1,30),time: (0,15),total: 10, correct: 10), HighScore(limit: (1,30),time: (0,10),total: 10,correct: 6), HighScore(limit: (1,30),time: (0,25),total: 20,correct: 10)];
        }
        else if(row == 4)
        {
            //highScores = savedSettings.objectForKey("highScores2") as! [HighScore];
            //highScores = [HighScore(limit: (2,0),time: (0,30),total: 10,correct: 1), HighScore(limit: (2,0),time: (0,28),total: 10,correct: 2), HighScore(limit: (2,0),time: (1,13),total: 10, correct: 10), HighScore(limit: (2,0),time: (0,10),total: 10,correct: 6), HighScore(limit: (2,0),time: (0,25),total: 20,correct: 10)];
        }
        else if(row == 5)
        {
            //highScores = savedSettings.objectForKey("highScores230") as! [HighScore];
            //highScores = [HighScore(limit: (2,30),time: (0,30),total: 10,correct: 1), HighScore(limit: (2,30),time: (0,28),total: 10,correct: 2), HighScore(limit: (2,30),time: (0,15),total: 10, correct: 10), HighScore(limit: (2,30),time: (0,10),total: 10,correct: 6), HighScore(limit: (2,30),time: (0,25),total: 20,correct: 10)];
        }
        else if(row == 6)
        {
            //highScores = savedSettings.objectForKey("highScores3") as! [HighScore];
            //highScores = [HighScore(limit: (3,0),time: (0,30),total: 10,correct: 1), HighScore(limit: (3,0),time: (0,28),total: 10,correct: 2), HighScore(limit: (3,0),time: (1,13),total: 10, correct: 10), HighScore(limit: (3,0),time: (0,10),total: 10,correct: 6), HighScore(limit: (3,0),time: (0,25),total: 20,correct: 10)];
        }
        currCategory = timeCategories[row];
        tableView.reloadData();
    }
    
    /*private func loadHighScores(){
     let savedSettings = NSUserDefaults.standardUserDefaults();
     highScores = savedSettings.objectForKey("highScores0") as! [HighScore];
     }*/
    
    //a functioning table view requires the following three table view data source methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let managedContext = DataController().managedObjectContext;
        let fetchRequest = NSFetchRequest(entityName: "Table");
        fetchRequest.predicate = NSPredicate(format: "category = %@", "highScores0");
        
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
        if(currCategory == "No Time Limit")
        {
            fetchRequest.predicate = NSPredicate(format: "category = %@", "highScores0");
        }
        else if(currCategory == "30 seconds")
        {
            fetchRequest.predicate = NSPredicate(format: "category = %@", "highScores30");
        }
        else if(currCategory == "1 minute")
        {
            fetchRequest.predicate = NSPredicate(format: "category = %@", "highScores1");

        }
        else if(currCategory == "1 minute 30 seconds")
        {
            fetchRequest.predicate = NSPredicate(format: "category = %@", "highScores130");

        }
        else if(currCategory == "2 minutes")
        {
            fetchRequest.predicate = NSPredicate(format: "category = %@", "highScores2");

        }
        else if(currCategory == "2 minutes 30 seconds")
        {
            fetchRequest.predicate = NSPredicate(format: "category = %@", "highScores230");

        }
        else if(currCategory == "3 minutes")
        {
            fetchRequest.predicate = NSPredicate(format: "category = %@", "highScores3");

        }
        do{
            let results = try managedContext.executeFetchRequest(fetchRequest)
            var scores = results as! [NSManagedObject]
            //print(scores[0] as! Table);
            let temp = (scores[0] as! Table).highScores?.reversedOrderedSet.objectAtIndex(indexPath.row) as! HighScore;
            let correct : Int = temp.valueForKey("numCorrect") as! Int;
            let total : Int = temp.valueForKey("totalProblems") as! Int;
            if(currCategory == "No Time Limit")
            {
                cell.highScoreEntry.text = "\(correct) correct out of \(total) problems";
                //cell.highScoreEntry.text = String(temp);
            }
            else
            {
                cell.highScoreEntry.text = "\(correct) correct out of \(total) problems in \(currCategory)"
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
    }
}