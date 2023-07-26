//
//  CityDetailsView.swift
//  OtusHW4
//
//  Created by Pablo on 14.06.2023.
//

import SwiftUI
import UIDesignSystem
import Networking

struct CityDetailsView: View {
    @EnvironmentObject private var navigation: NavigationStackViewModel
    private var weather: Weather
    private var cityName: String
    
    var temperature: String {
        if let temp = self.weather.feelslikeC {
            return String(format: "%.0f", temp)
        } else {
            return ""
        }
    }
    
    init(cityName: String, weather: Weather) {
        self.cityName = cityName
        self.weather = weather
    }
    
    func conditionalDouble(_ double: Double?) -> String {
        if let double = double {
            return String(format: "%.0f", double)
        } else {
            return "No data avialible"
        }
    }
    
    var body: some View {
        VStack {
            Text(cityName).font(.title)
            Text("Air temperature").font(.system(size: 24))
            Text("\(conditionalDouble(weather.tempC))°C").font(.system(size: 30))
            Text("Fells like \(conditionalDouble(weather.feelslikeC))°C")
            Text("Humidity: \(weather.humidity ?? 0)%")
            Text("Wind speed \(conditionalDouble(weather.windKph)) kph")
            Button("Back") {
                navigation.pop()
            }
        }
    }
}

struct CityDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CityDetailsView(cityName: "Moscow", weather: Weather(feelslikeC: 21.4, windDegree: 60, tempC: 20.3, windKph: 8.3, humidity: 55))
    }
}
