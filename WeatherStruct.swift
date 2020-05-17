//
//  Weather.swift
//  Projet 9
//
//  Created by Michael Aidan on 29/03/2020.
//  Copyright © 2020 Michael Aidan. All rights reserved.
//

import Foundation
struct WeatherStruct:  Codable {

    var main: Main
    var weather:[Weather]
}


struct Weather: Codable {
    var description: String
    var id: Int
    var icon: String
    
}

struct Main:Codable {
   var temp : Double
    var feels_like: Double
   var  temp_min: Double
   var  temp_max: Double
    var pressure: Double
   var humidity: Double
}
