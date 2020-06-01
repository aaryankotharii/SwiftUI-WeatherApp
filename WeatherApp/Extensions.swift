//
//  Extensions.swift
//  WeatherApp
//
//  Created by Aaryan Kothari on 31/05/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import Foundation

extension Double {
    var round : Int{
        return Int(self)
    }
}

extension Date {
    var weekData : [Int]{
        let days = [-1,-2,-3,-4,-5]
        let value = days.map {
            Int(Calendar.current.date(byAdding: .day, value: $0, to: Date())!.timeIntervalSince1970)
        }
        return value
    }
}

extension Int {
    var toString : String{
        return String(self)
    }
}

extension DateFormatter{
    convenience init(dateFormat : String){
        self.init()
        self.dateFormat = dateFormat
    }
}

extension Date {
    
    static func dateFromUnixTimeStamp(_ timestamp : TimeInterval)->Date {
        return Date(timeIntervalSince1970: timestamp)
    }
    
    var day : String {
        let dateformatter = DateFormatter(dateFormat: "EEEE")
        return dateformatter.string(from: self)
    }
    
    func dayOfTheWeekFromTimeStamp(_ timestamp : TimeInterval)-> String {
        let date = Date.dateFromUnixTimeStamp(timestamp)
        return date.day
    }
}
