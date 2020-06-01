//
//  CurrentWeatherViewModel.swift
//  WeatherApp
//
//  Created by Aaryan Kothari on 31/05/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import Foundation
import Combine

final class CurrentWeatherViewModel : ObservableObject{
    @Published var current : Weather?
    init() {
        DispatchQueue.main.async {
            self.fetch()
        }
    }
}

/// fetch function
extension CurrentWeatherViewModel {
    func fetch(_ city : String = "mumbai"){
        API.fetchCurrentWeather(by: city) {
            self.current = $0
        }
    }
}
