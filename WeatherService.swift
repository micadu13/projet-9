//
//  WeatherService.swift
//  Projet 9
//
//  Created by Michael Aidan on 14/04/2020.
//  Copyright © 2020 Michael Aidan. All rights reserved.
//

import Foundation
class WeatherService{
    
   
    private static let weatherNewYork = URL(string:"https://api.openweathermap.org/data/2.5/weather?q=New%20York&appid=a2d085cb1033204cd44ff5eb3bfd210a")!
    
    static func getWeatherNewYork(completionHandler: @escaping (Bool, Weather?)->Void){
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: weatherNewYork){(data, response, error) in
            
            guard let data = data, error == nil else {
                return completionHandler(false, nil)
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return completionHandler(false, nil)
            }
            
            guard let weatherNewYork = try? JSONDecoder().decode(Weather.self, from: data) else {
                return completionHandler(false, nil)
            }
            
            return completionHandler(true, weatherNewYork)
        }
        task.resume()
    }
    
    
    
    
    
    
    
    func getWeatherFromMarseille(){
        
    }
}
