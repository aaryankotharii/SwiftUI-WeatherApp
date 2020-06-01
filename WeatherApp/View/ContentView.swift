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
    @ObservedObject var weeklyWeather = WeeklyWeatherViewModel()
    @State private var selected : Int = 0
    
    private var height : CGFloat = UIScreen.main.bounds.height
    
    @State var city : String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            TextField("Enter your city", text: $city){
                self.weather.fetch(self.city)
                self.weeklyWeather.fetch(by: self.city)
            }.padding(.horizontal)
            GeometryReader { gr in
                CurrentWeather(weather: self.weather.current, height: self.selected == 0 ? gr.size.height : (gr.size.height*0.75)).modifier(currentViewModifier()).animation(.easeInOut(duration: 0.5))
            }
            WeeklyWeatherView(weeklyWeather: self.weeklyWeather.weather ?? [], value: selected, height : height * 0.5)
            Picker("", selection: $selected) {
                Text("Today").tag(0)
                Text("Week").tag(1)
            }.pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
        }.frame(minWidth: .zero, maxWidth: .infinity, minHeight: .zero, maxHeight: .infinity)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
