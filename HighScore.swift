//
//  HighScore.swift
//  KnowYourAngles
//
//  Created by iPad App Dev on 12/23/16.
//  Copyright © 2016 Iolani School. All rights reserved.
//

import Foundation
import CoreData


class HighScore: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

}
// High Scores should be compared first by time limit, then by accuracy (number of correct answers divided by total problems), and finally by time taken

func == (left: HighScore, right: HighScore) -> Bool
{
    //first compare time limits
    if(left.timeLimitMin == right.timeLimitMin && left.timeLimitSec == right.timeLimitSec)
    {
        //then compare accuracy
        if(Double(left.numCorrect!) / Double(left.totalProblems!) == Double(right.numCorrect!) / Double(right.totalProblems!))
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

func < (left: HighScore, right: HighScore) -> Bool
{
    //first compare time limits (minutes)
    if(left.timeLimitMin?.intValue < right.timeLimitMin?.intValue)
    {
        return true;
    }
    else if (left.timeLimitMin == right.timeLimitMin)
    {
        //then compare time limits (seconds)
        if(left.timeLimitSec?.intValue < right.timeLimitSec?.intValue)
        {
            return true;
        }
        else if (left.timeLimitSec == right.timeLimitSec)
        {
            //now compare accuracy
            if(Double(left.numCorrect!) / Double(left.totalProblems!) < Double(right.numCorrect!) / Double(right.totalProblems!))
            {
                return true;
            }
            else if(Double(left.numCorrect!) / Double(left.totalProblems!) == Double(right.numCorrect!) / Double(right.totalProblems!))
            {
                //then compare time taken (minutes)
                if(left.timeTakenMin?.intValue < right.timeTakenMin?.intValue)
                {
                    return true;
                }
                else if (left.timeTakenMin == right.timeTakenMin)
                {
                    //then compare time taken (seconds)
                    if(left.timeTakenSec?.intValue < right.timeTakenSec?.intValue)
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

func <= (left: HighScore, right: HighScore) -> Bool
{
    //first compare time limits (minutes)
    if(left.timeLimitMin?.intValue < right.timeLimitMin?.intValue)
    {
        return true;
    }
    else if (left.timeLimitMin == right.timeLimitMin)
    {
        //then compare time limits (seconds)
        if(left.timeLimitSec?.intValue < right.timeLimitSec?.intValue)
        {
            return true;
        }
        else if (left.timeLimitSec == right.timeLimitSec)
        {
            //now compare accuracy
            if(Double(left.numCorrect!) / Double(left.totalProblems!) < Double(right.numCorrect!) / Double(right.totalProblems!))
            {
                return true;
            }
            else if(Double(left.numCorrect!) / Double(left.totalProblems!) == Double(right.numCorrect!) / Double(right.totalProblems!))
            {
                //then compare time taken (minutes)
                if(left.timeTakenMin?.intValue < right.timeTakenMin?.intValue)
                {
                    return true;
                }
                else if (left.timeTakenMin == right.timeTakenMin)
                {
                    //then compare time taken (seconds)
                    if(left.timeTakenSec?.intValue < right.timeTakenSec?.intValue || left.timeTakenSec?.intValue == right.timeTakenSec?.intValue)
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

func > (left: HighScore, right: HighScore) -> Bool
{
    return !(left <= right);
}

func >= (left: HighScore, right: HighScore) -> Bool
{
    return !(left < right);
}
