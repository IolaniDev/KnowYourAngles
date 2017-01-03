//
//  HighScoreCustom.swift
//  KnowYourAngles
//
//  Created by iPad App Dev on 12/21/16.
//  Copyright © 2016 Iolani School. All rights reserved.
//

import Foundation
import CoreData

class HighScoreCustom : NSManagedObject, Comparable{
    @NSManaged var timeLimitMin : Int;
    @NSManaged var timeLimitSec : Int;
    @NSManaged var timeTakenMin : Int;
    @NSManaged var timeTakenSec : Int;
    @NSManaged var totalProblems : Int;
    @NSManaged var numCorrect : Int;
    
    override var description : String
    {
        if(timeLimitMin == 0 && timeLimitSec == 0)
        {
            return "\(numCorrect) correct out of \(totalProblems) problems"
        }
        else
        {
            return "\(numCorrect) correct out of \(totalProblems) problems in \(timeTakenMin) minutes and \(timeTakenSec) seconds"
        }
    }
    
    /*convenience init()
    {
        self.init()
        timeLimitMin = 0;
        timeLimitSec = 0;
        timeTakenMin = 0;
        timeTakenSec = 0;
        totalProblems = 0;
        numCorrect = 0;
    }
    
    convenience init(limitMin : Int, limitSec: Int, timeMin : Int, timeSec : Int, total : Int, correct : Int)
    {
        self.init();
        timeLimitMin = limitMin;
        timeLimitSec = limitSec;
        timeTakenMin = timeMin;
        timeTakenSec = timeSec;
        totalProblems = total;
        numCorrect = correct;
    }*/
}

// High Scores should be compared first by time limit, then by accuracy (number of correct answers divided by total problems), and finally by time taken

func == (left: HighScoreCustom, right: HighScoreCustom) -> Bool
{
    //first compare time limits
    if(left.timeLimitMin == right.timeLimitMin && left.timeLimitSec == right.timeLimitSec)
    {
        //then compare accuracy
        if(Double(left.numCorrect) / Double(left.totalProblems) == Double(right.numCorrect) / Double(right.totalProblems))
        {
            //then compare time taken
            if(left.timeTakenMin == right.timeTakenMin && left.timeTakenSec == right.timeTakenSec)
            {
                return true;
            }
        }
    }
    return false;
}
    
func < (left: HighScoreCustom, right: HighScoreCustom) -> Bool
{
    //first compare time limits (minutes)
    if(left.timeLimitMin < right.timeLimitMin)
    {
        return true;
    }
    else if (left.timeLimitMin == right.timeLimitMin)
    {
        //then compare time limits (seconds)
        if(left.timeLimitSec < right.timeLimitSec)
        {
            return true;
        }
        else if (left.timeLimitSec == right.timeLimitSec)
        {
            //now compare accuracy
            if(Double(left.numCorrect) / Double(left.totalProblems) < Double(right.numCorrect) / Double(right.totalProblems))
            {
                return true;
            }
            else if(Double(left.numCorrect) / Double(left.totalProblems) == Double(right.numCorrect) / Double(right.totalProblems))
            {
                //then compare time taken (minutes)
                if(left.timeTakenMin < right.timeTakenMin)
                {
                    return true;
                }
                else if (left.timeTakenMin == right.timeTakenMin)
                {
                    //then compare time taken (seconds)
                    if(left.timeTakenSec < right.timeTakenSec)
                    {
                        return true;
                    }
                }
            }
        }
    }
    //left-min > right-min
    return false;
}
    
func <= (left: HighScoreCustom, right: HighScoreCustom) -> Bool
{
    //first compare time limits (minutes)
    if(left.timeLimitMin < right.timeLimitMin)
    {
        return true;
    }
    else if (left.timeLimitMin == right.timeLimitMin)
    {
        //then compare time limits (seconds)
        if(left.timeLimitSec < right.timeLimitSec)
        {
            return true;
        }
        else if (left.timeLimitSec == right.timeLimitSec)
        {
            //now compare accuracy
            if(Double(left.numCorrect) / Double(left.totalProblems) < Double(right.numCorrect) / Double(right.totalProblems))
            {
                return true;
            }
            else if(Double(left.numCorrect) / Double(left.totalProblems) == Double(right.numCorrect) / Double(right.totalProblems))
            {
                //then compare time taken (minutes)
                if(left.timeTakenMin < right.timeTakenMin)
                {
                    return true;
                }
                else if (left.timeTakenMin == right.timeTakenMin)
                {
                    //then compare time taken (seconds)
                    if(left.timeTakenSec < right.timeTakenSec || left.timeTakenSec == right.timeTakenSec)
                    {
                        return true;
                    }
                }
            }
        }
    }
    //left-min > right-min
    return false;
}
    
func > (left: HighScoreCustom, right: HighScoreCustom) -> Bool
{
    return !(left <= right);
}

func >= (left: HighScoreCustom, right: HighScoreCustom) -> Bool
{
    return !(left < right);
}
