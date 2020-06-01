//
//  WeeklyWeatherView.swift
//  WeatherApp
//
//  Created by Aaryan Kothari on 01/06/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import SwiftUI

struct WeeklyWeatherView: View {
    var weeklyWeather : [WeeklyWeather]
    var value : Int = 0
    var height :CGFloat = 0
    var width = UIScreen.main.bounds.width/2
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                ForEach(weeklyWeather) {  data in
                    CardView(weeklyWeather: data)
                        .frame(width: self.width, height: self.value == 0 ? 0 : self.height * 0.6)
                        .animation(.easeInOut(duration: 0.5))
                        .modifier(CardViewModifier())
                        //.modifier(CardViewModifier(TimeInterval(data.current.dt)))
                }
            }
        }
        .padding(20)
        .frame(height: self.value == 0 ? 0 : self.height * 0.65)
        .animation(.easeInOut(duration: 0.5))
    }
}



