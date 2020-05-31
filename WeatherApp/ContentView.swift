//
//  ContentView.swift
//  WeatherApp
//
//  Created by Aaryan Kothari on 31/05/20.
//  Copyright © 2020 Aaryan Kothari. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weather = CurrentWeatherViewModel()
    @State private var selected : Int = 0
    

    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            GeometryReader { gr in
                CurrentWeather(weather: self.weather.current, height: self.selected == 0 ? gr.size.height : (gr.size.height*0.5)).animation(.easeInOut(duration: 0.5))
            }
            Picker("", selection: $selected) {
                Text("Today").tag(0)
                Text("Week").tag(1)
            }.pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
