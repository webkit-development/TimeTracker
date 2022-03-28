//
//  Period.swift
//  TimeTracker
//
//  Created by Kevin Stradtman on 3/27/22.
//

import Cocoa

extension Period {
    func currentlyString() -> String {
        if let inDate = self.inDate {
            return stringFromDates(date1: inDate, date2: Date())
        }
        return "ERROR"
    }
    
    func stringFromDates(date1: Date, date2: Date) -> String {
        var theString = ""
        let cal = Calendar.current.dateComponents([.hour, .minute, .second], from: date1, to: date2)
        guard let hour = cal.hour, let minute = cal.minute, let second = cal.second else {
            return "ERROR 2"
        }
        if hour > 0 {
            theString += "\(hour)h \(minute)m "
        } else {
            if minute > 0 {
                theString += "\(minute)m "
            }
        }
        theString += "\(second)s"
        return theString
    }
}
