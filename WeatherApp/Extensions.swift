//
//  Extensions.swift
//  WeatherApp
//
//  Created by Aaryan Kothari on 31/05/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import Foundation
import SwiftUI

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
    
    public func dayOfTheWeekFromTimeStamp(_ timestamp : TimeInterval)-> String {
        let date = Date.dateFromUnixTimeStamp(timestamp)
        return date.day
    }
}

extension Color {
    init(hex:String){
        let scanner = Scanner(string: hex)
        var rgbValue : UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(red: Double(r), green: Double(g), blue: Double(b))
    }
    
    static var monday : [Color] {
        return [Color.init(hex: "232526"),Color.init(hex: "414345")]
    }
    
    static var tuesday : [Color] {
        return [Color.init(hex: "FF512F"),Color.init(hex: "F09819")]
    }
    
    static var wednesday : [Color] {
        return [Color.init(hex: "870000"),Color.init(hex: "190A05")]
    }
    
    static var thursday : [Color] {
        return [Color.init(hex: "7F00FF"),Color.init(hex: "E100FF")]
    }
    
    static var friday : [Color] {
        return [Color.init(hex: "AA076B"),Color.init(hex: "61045F")]
    }
    
    static var saturday : [Color] {
        return [Color.init(hex: "e53935"),Color.init(hex: "e35d5b")]
    }
    
    static var sunday : [Color] {
        return [Color.init(hex: "2193b0"),Color.init(hex: "6dd5ed")]
    }
    
    func gradientColorOfTheDay(_ day : String)->[Color]{
        switch day{
        case "Monday":
            return Color.monday
        case "Tuesday":
            return Color.tuesday
        case "Wednesday":
            return Color.wednesday
        case "Thursday":
            return Color.thursday
        case "Friday":
            return Color.friday
        case "Saturday":
            return Color.saturday
        case "Sunday":
            return Color.sunday
        default:
            return Color.monday
        }
    }
}
