//
//  WeeklyWeather.swift
//  WeatherApp
//
//  Created by Aaryan Kothari on 31/05/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import Foundation

struct WeeklyWeather : Codable {
    let lat, lon : Double
    let current : Current
}

struct Current : Codable {
    let dt, sunrise, sunset, temp, pressure, humidity, clouds, wind_deg, visibility : Int
    let feels_like, dew_point, uvi, wind_speed: Double
    let weather : [WeeklyData]
}

struct WeeklyData : Codable, Identifiable{
    let id: Int
    let main, description, icon : String
}

