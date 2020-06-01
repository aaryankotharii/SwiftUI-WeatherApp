//
//  Weather.swift
//  WeatherApp
//
//  Created by Aaryan Kothari on 31/05/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import Foundation


struct Weather: Codable {
    let id, timezone, cod, dt : Int
    let name , base : String
    let coord : Coord
    let weather : [WeatherData]
    let main : Main
    let wind : Wind
    let sys : Sys
}

struct Coord : Codable {
    let lon, lat : Double
}

struct WeatherData : Codable, Identifiable {
    let id : Int
    let main, description, icon : String
}

struct Main: Codable {
    let temp, temp_min, temp_max, feels_like : Double
    let pressure, humidity : Int
}

struct Wind : Codable {
    let speed : Double
    let deg : Int
}

struct Clouds : Codable{
    let all : Int
}

struct Sys: Codable {
    let type, id, sunrise, sunset : Int
    let country : String
}

