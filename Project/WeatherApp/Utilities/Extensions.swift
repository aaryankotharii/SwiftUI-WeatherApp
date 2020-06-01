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
    
    static var monday : [Color] {
        return [Color(#colorLiteral(red: 0.7411764706, green: 0.5960784314, blue: 0.5490196078, alpha: 1)),Color(#colorLiteral(red: 0.7411764706, green: 0.5960784314, blue: 0.5490196078, alpha: 1))]
    }
    
    static var tuesday : [Color] {
        return [Color(#colorLiteral(red: 0.2027700543, green: 0.8196676373, blue: 0.745729506, alpha: 1)),Color(#colorLiteral(red: 0.206817776, green: 0.8314474225, blue: 0.7451662421, alpha: 1))]
    }
    
    static var wednesday : [Color] {
        return [Color(#colorLiteral(red: 0.6666666667, green: 0.8784313725, blue: 0.9254901961, alpha: 1)),Color(#colorLiteral(red: 0.6666666667, green: 0.8784313725, blue: 0.9254901961, alpha: 1))]
    }
    
    static var thursday : [Color] {
        return [Color(#colorLiteral(red: 0.6588235294, green: 0.8196078431, blue: 0.9176470588, alpha: 1)),Color(#colorLiteral(red: 0.6666666667, green: 0.8784313725, blue: 0.9254901961, alpha: 1))]
    }
    
    static var friday : [Color] {
        return [Color(#colorLiteral(red: 0.7411764706, green: 0.5960784314, blue: 0.5490196078, alpha: 1)),Color(#colorLiteral(red: 0.7411764706, green: 0.5960784314, blue: 0.5490196078, alpha: 1))]
    }
    
    static var saturday : [Color] {
        return [Color(#colorLiteral(red: 0.6666666667, green: 0.8784313725, blue: 0.9254901961, alpha: 1)),Color(#colorLiteral(red: 0.6666666667, green: 0.8784313725, blue: 0.9254901961, alpha: 1))]
    }
    
    static var sunday : [Color] {
        return [Color(#colorLiteral(red: 0.2274509804, green: 0.2078431373, blue: 0.2509803922, alpha: 1)),Color(#colorLiteral(red: 0.2274509804, green: 0.2078431373, blue: 0.2509803922, alpha: 1))]
    }
    
  static func gradientColorOfTheDay(_ day : String)->[Color]{
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
