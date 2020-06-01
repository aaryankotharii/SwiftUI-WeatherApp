//
//  CardView.swift
//  WeatherApp
//
//  Created by Aaryan Kothari on 01/06/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var weeklyWeather : WeeklyWeather
    var body: some View {
        VStack{
            Text("dayofweelfromtimestamp \(weeklyWeather.current.dt).timestamp")
                .font(.title)
                .foregroundColor(.white)
            HStack{
                Text(weeklyWeather.current.temp.round.toString)
                Text(weeklyWeather.current.feels_like.round.toString)
                    .font(.title)
                    .foregroundColor(.white)
            }
            Text(weeklyWeather.current.weather.last?.description ?? "")
                .font(.body)
                .foregroundColor(.white)
        }
    }
}

struct CardViewModifier : ViewModifier {
    var timeStamp : TimeInterval
    init(_ timestamp : TimeInterval) {
        self.timeStamp = timestamp
    }
    
    func body(content : Content) -> some View{
        content
            .background(LinearGradient(gradient: Gradient(colors: [.blue,.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
    }
    
    private var day : String{
        return "dayOfWeekFromTimeStamp"
    }
}


