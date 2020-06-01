//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Aaryan Kothari on 31/05/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import SwiftUI

struct CurrentWeather: View {
    var weather : Weather?
    var height : CGFloat = 0
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Today in \(weather?.name ?? "Unknown")")
                .font(.title)
                .foregroundColor(.white)
            .bold()
            HStack{
                Text("\(weather?.main.temp.round ?? 0)")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .font(.system(size: 20))
                Image(weather?.weather.last?.icon ?? "01d")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .aspectRatio(contentMode: .fit)
            }
            Text("\(weather?.weather.last?.description ?? "Unknown")")
                .foregroundColor(.white)
                .font(.body)
            
        }.frame(width: height, height: height)
            .background(LinearGradient(gradient: Gradient(colors: [.blue,.purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct currentViewModifier : ViewModifier{
    private var radius : CGFloat = 20
    private var xAxis : CGFloat = 20
    private var yAxis : CGFloat = 20
    
    func body(content: Content) -> some View {
        content
            .cornerRadius(radius)
            .shadow(color: .gray, radius: radius, x: xAxis, y: yAxis)
            .opacity(0.8)
        
    }
}
