//
//  CityView.swift
//  Weather2
//
//  Created by Sofi on 28.12.2020.
//

import SwiftUI

struct CityView: View {
    @ObservedObject var cityViewModel = CityViewModel()
    @State var cityState = ""
    init() {
        UINavigationBar.appearance().barTintColor = UIColor.blue
    }
    
    var body: some View {
    
        NavigationView{
           
            List(cityViewModel.cities, id: \.self) { city in
//                ForEach(cityViewModel.cities, id: \.self) { city in
                    HStack {
                        Text(city.nameCity)
                        Spacer()
                        Text(city.temp + "℃")
                        NavigationLink(
                            destination: DetailCityView(city:  city ),
                            label: {
                            }).frame(width: 0, height: 0, alignment: .center)
                            .hidden()
                            .navigationBarTitle("Cities", displayMode: .inline)
                            
                            .navigationBarItems(trailing: Button(action: {}, label: {
                                Image(systemName: "plus")
                                
                            }))
                        
                    }
//                }
            }
            }
        
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        CityView()
    }
}
