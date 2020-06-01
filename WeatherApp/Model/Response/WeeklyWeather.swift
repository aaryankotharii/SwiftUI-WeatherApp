//
//  WeeklyWeather.swift
//  WeatherApp
//
//  Created by Aaryan Kothari on 31/05/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import Foundation

struct WeeklyWeather : Codable, Identifiable {
    let id = UUID()
    let lat, lon : Double
    let current : Current
}

struct Current : Codable {
    let dt, sunrise, sunset, pressure, humidity, clouds, wind_deg, visibility : Int
    let feels_like, dew_point, uvi, wind_speed,temp: Double
    let weather : [WeeklyData]
}

struct WeeklyData : Codable, Identifiable{
    let id: Int
    let main, description, icon : String
}

