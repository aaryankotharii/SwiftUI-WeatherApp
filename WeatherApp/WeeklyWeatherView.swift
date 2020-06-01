//
//  WeeklyWeatherView.swift
//  WeatherApp
//
//  Created by Aaryan Kothari on 01/06/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import SwiftUI

struct WeeklyWeatherView: View {
    var weeklyWeather : [WeeklyWeather] = []
    var value : Int = 0
    var height :CGFloat = 0
    var width = UIScreen.main.bounds.width/2
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                ForEach(weeklyWeather) {  data in
                    Text("\(data.lat)")
                }
            }
        }
    }
}

struct WeeklyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyWeatherView()
    }
}



