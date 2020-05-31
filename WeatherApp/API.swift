//
//  API.swift
//  WeatherApp
//
//  Created by Aaryan Kothari on 31/05/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import Foundation

class API {
    
    enum Endpoints {
        
        static let dailyBase = "http://api.openweathermap.org/data/2.5"
        static let weeklyBase = "api.openweathermap.org/data/2.5/forecast"
        static let appid = "9b8cb5423c57be885f14f8033b16ca29"
        
        case daily(city:String)
        
        var stringValue : String {
            
            switch self {
            case .daily(city: let city):
                return   Endpoints.dailyBase + "/weather?q=\(city)&APPID=" + Endpoints.appid + "&units=metric"
            }
        }
        
        var url : URL {
            return URL(string: self.stringValue)!
        }
    }
    
    class func fetchCurrentWeather(by city : String, onSuccess : (Weather)->()){
        
    }
}

enum Units : String{
    case imperial
    case metric
}
