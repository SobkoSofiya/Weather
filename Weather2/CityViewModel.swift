//
//  CityViewModel.swift
//  Weather2
//
//  Created by Sofi on 28.12.2020.
//

import Foundation
import SwiftUI
import SwiftyJSON
import Alamofire

class CityViewModel: ObservableObject {
    @Published var cities: [CityModel] = []
    
   
    func uploadData(nameCity: String) {
        let url = "https://api.weatherapi.com/v1/current.json?key=34de8e48d0944de6a83131619202610&q=\(nameCity)"
        AF.request(url, method: .get).validate().responseJSON { [self] response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                self.cities.append(CityModel( nameCity: json["location"]["name"].stringValue, temp: json["current"]["temp_c"].stringValue, date: json["location"]["localtime"].stringValue, image: json["current"]["condition"]["icon"].stringValue))
//                self.cities.append(CityModel(nameCity: "Kazan", temp: "20", date: "20.02.2020", image: "..."))
            case .failure(let error):
                print(error)
            }
        }
        
    }
}







