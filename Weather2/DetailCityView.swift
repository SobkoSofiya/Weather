//
//  DetailCityView.swift
//  Weather2
//
//  Created by Sofi on 28.12.2020.
//

import SwiftUI

struct DetailCityView: View {
    @State var city: CityModel
    var body: some View {
        VStack {
            Text("\(city.nameCity)")
            Text("\(city.date)")
            Text("\(city.temp)")
            Text("\(city.image)")
        }
       
        
    }
}


