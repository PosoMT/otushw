//
//  ContentView.swift
//  OtusHW4
//
//  Created by Pablo on 10.05.2023.
//

import SwiftUI
import UIDesignSystem


struct ContentView: View {
    @State var pickerTab = 0
    
    // Пейджинга, увы в этом API не было. Глубина в 3 экрана достигнута выбором: Страна - город - подробности
    private var country = ["Russia", "Belarus"]
    
    var body: some View {
        NavigationStackView(transition: .custom(AnyTransition.slideDownCurve)) {
            VStack {
                Picker("Countries", selection: $pickerTab) {
                    ForEach(0 ..< country.count, id: \.self) {
                        index in
                        Text(self.country[index])
                            .tag(index)
                    }
                }
                .pickerStyle(.segmented)
                
                switch pickerTab {
                case 0:
                    CountryView(country: .Russia)
                case 1:
                    CountryView(country: .Belarus)
                default:
                    EmptyView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
