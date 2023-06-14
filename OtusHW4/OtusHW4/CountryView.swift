//
//  CountryView.swift
//  OtusHW4
//
//  Created by Pablo on 13.06.2023.
//

import SwiftUI
import UIDesignSystem

enum SelectedCounty {
    case Russia
    case Belarus
}

struct CountryView: View {
    @EnvironmentObject private var navigation: NavigationStackViewModel
    @State var offsetY : CGFloat = 0
    
    private let country: SelectedCounty
    
    private var citiesList: [String] = .init()
    private let citiesListRussia = ["Moscow", "Kazan", "Saint Petersburg"]
    private let citiesListBelarus = ["Minsk", "Gomel", "Baranovichi"]
    
    init(country: SelectedCounty) {
        self.country = country
        switch country {
        case .Russia:
            citiesList = citiesListRussia
        case .Belarus:
            citiesList = citiesListBelarus
        }
    }
    
    var body: some View {
        List(citiesList, id: \.self) {
            city in
            Text(city)
                .onTapGesture {
                    navigation.push(CityView(city: city))
                    withAnimation(.easeIn(duration: 0.5)) {
                        offsetY = 400
                    }
                }
        }
        .offset(x: 0, y: offsetY)
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        CountryView(country: .Russia)
    }
}
