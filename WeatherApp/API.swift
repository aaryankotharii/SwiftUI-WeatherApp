//
//  API.swift
//  WeatherApp
//
//  Created by Aaryan Kothari on 31/05/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import Foundation
import MapKit

class API {
    
    enum Endpoints {
        
        static let dailyBase = "http://api.openweathermap.org/data/2.5"
        static let weeklyBase = "https://api.openweathermap.org/data/2.5/onecall"
        static let appid = "9b8cb5423c57be885f14f8033b16ca29"
        
        case daily(city:String)
        case weekly(lat:Double,long:Double,dt:Int)
        
        var stringValue : String {
            
            switch self {
            case .daily(city: let city):
                return   Endpoints.dailyBase + "/weather?q=\(city)&APPID=" + Endpoints.appid + "&units=metric"
            case .weekly(let lat , let long, let dt):
                return Endpoints.weeklyBase + "/timemachine?lat=\(lat)&lon=\(long)&dt=\(dt)&appid=" + Endpoints.appid + "&units=metric"
            }
        }
        
        var url : URL {
            return URL(string: self.stringValue)!
        }
    }
    
    
    class func getWeather<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) -> URLSessionDataTask {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completion(responseObject, nil)
                }
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
        
        return task
    }
    
    
    
    
    class func fetchCurrentWeather(by city : String, completion : @escaping (Weather?)->()){
        let url = Endpoints.daily(city: city).url
        getWeather(url: url, responseType: Weather.self) { (result, error) in
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
                return
            }
            completion(result)
        }
    }
    
    class func fetchWeeklyWeather(by city : String, completion : @escaping ([WeeklyWeather?])->()){
        MapClient.TextToLocation(city) { (location, error) in
            if let  error = error{
                print(error.localizedDescription)
                return
            }
            guard let location = location else { return }
            let lat = location.coordinate.latitude
            let long = location.coordinate.longitude
            for dates in Date().weekData{
                API.getWeather(url: Endpoints.weekly(lat: lat, long: long, dt: dates).url, responseType: WeeklyWeather.self) { (result, error) in
                    print(result)
                }
            }
        }
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
