//
//  Settings.swift
//  KnowYourAngles
//
//  Created by Cart 115 Administrator on 7/12/16.
//  Copyright © 2016 Iolani School. All rights reserved.
//

import Foundation

class Settings : NSObject, NSCoding{
    
    var maxNumOfProblems : Int
    var timer : Bool
    var time : Int
    var degrees : Bool
    var radians : Bool
    var reciprocals : Bool
    
    struct propertyKey {
        static let maxNumOfProblemsKey = "maxNumOfProblems";
        static let timerKey = "timer";
        static let timeKey = "time";
        static let includeDegKey = "degrees";
        static let includeRadKey = "radians";
        static let includeReciprocalKey = "reciprocals";
    }
    
    func encodeWithCoder(aCoder: NSCoder){
        aCoder.encodeInteger(maxNumOfProblems, forKey: propertyKey.maxNumOfProblemsKey);
        aCoder.encodeBool(timer, forKey: propertyKey.timerKey);
        aCoder.encodeInteger(time, forKey: propertyKey.timeKey);
        aCoder.encodeBool(degrees, forKey: propertyKey.includeDegKey);
        aCoder.encodeBool(radians, forKey: propertyKey.includeRadKey);
        aCoder.encodeBool(reciprocals, forKey: propertyKey.includeReciprocalKey);
    }
    
    init?(num : Int, isTimer : Bool, time : Int, isDeg : Bool, isRad : Bool, isReciprocal : Bool)
    {
        maxNumOfProblems = num;
        timer = isTimer;
        self.time = time;
        degrees = isDeg;
        radians = isRad;
        reciprocals = isReciprocal;
        
        super.init()
    }
    
    required convenience init?(coder aDecoder: NSCoder){
        let maxNumOfProblems = aDecoder.decodeObjectForKey(propertyKey.maxNumOfProblemsKey) as! Int;
        let timer = aDecoder.decodeObjectForKey(propertyKey.timerKey) as! Bool;
        let time = aDecoder.decodeObjectForKey(propertyKey.timeKey) as! Int;
        let degrees = aDecoder.decodeObjectForKey(propertyKey.includeDegKey) as! Bool;
        let radians = aDecoder.decodeObjectForKey(propertyKey.includeRadKey) as! Bool;
        let reciprocals = aDecoder.decodeObjectForKey(propertyKey.includeReciprocalKey) as! Bool;
        self.init(num: maxNumOfProblems, isTimer: timer, time: time, isDeg: degrees, isRad: radians, isReciprocal: reciprocals);
    }
    
    //Mark: Archiving Paths
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!;
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("settings");
}