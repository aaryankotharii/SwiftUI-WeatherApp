//
//  WeeklyWeatherViewModel.swift
//  WeatherApp
//
//  Created by Aaryan Kothari on 01/06/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import SwiftUI
import Combine

class WeeklyWeatherViewModel : ObservableObject {
    
    @Published var weather : [WeeklyWeather?]?
    
    init() {
        self.fetch()
    }
}

extension WeeklyWeatherViewModel {
    func fetch(by city : String = "mumbai"){
        API.fetchWeeklyWeather(by: city) {
            self.weather = $0
        }
    }
}
