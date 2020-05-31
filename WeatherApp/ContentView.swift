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
    
    var body: some View {
        VStack{
            Text(weather.current?.name ?? "")
        Text("Hello, World!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
