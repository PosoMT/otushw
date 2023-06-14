//
//  MoscowView.swift
//  OtusHW4
//
//  Created by Pablo on 07.06.2023.
//

import SwiftUI
import Networking
import UIDesignSystem

final class CityWeatherViewModel: ObservableObject {
    
    @Published var weather = Weather()
    
    init(city: String) {
        fetchWeather(city: city)
    }
    
    var temperature: String {
        if let temp = self.weather.feelslikeC {
            return String(format: "%.0f", temp)
        } else {
            return ""
        }
    }
    
    func fetchWeather(city: String) {
        var result: Weather? = Weather()
        DefaultAPI.v1CurrentJsonGet(q: city, key: "6ff81caa0fb540f4b23232022230606") { data, error in
            result = data?.current
            if result != nil {
            self.weather = result!
            }
        }
    }
}

struct CityView: View {
    @EnvironmentObject private var navigation: NavigationStackViewModel
    @ObservedObject var weatherVM: CityWeatherViewModel
    
    let city: String
    
    init(city: String) {
        self.city = city
        self.weatherVM = CityWeatherViewModel(city: city)
    }
    
    var body: some View {
        VStack {
            Text("\(self.weatherVM.temperature)°C").font(.system(size: 30))
            Text(city).font(.system(size: 16))
            Button("Details") {
                navigation.push(CityDetailsView(cityName: city, weather: weatherVM.weather))
            }
            Button("Back") {
                navigation.pop()
            }
        }
    }
}

struct MoscowView_Previews: PreviewProvider {
    static var previews: some View {
        CityView(city: "Moscow")
    }
}
