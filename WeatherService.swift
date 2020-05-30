//
//  WeatherService.swift
//  Projet 9
//
//  Created by Michael Aidan on 14/04/2020.
//  Copyright © 2020 Michael Aidan. All rights reserved.
//
import UIKit
import Foundation

class WeatherService{
    
    
    private static let weatherNewYork = URL(string:"https://api.openweathermap.org/data/2.5/weather?q=New%20York&appid=a2d085cb1033204cd44ff5eb3bfd210a")!
    
 
    
    static func getWeatherFromNewYork(completionHandler: @escaping (Bool, WeatherStruct?) -> Void) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: weatherNewYork){(data, response, error) in
            
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    return completionHandler(false, nil)
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    return completionHandler(false, nil)
                }
                
                guard let weatherNewYork = try? JSONDecoder().decode(WeatherStruct.self, from: data) else {
                    return completionHandler(false, nil)
                }
                
                return completionHandler(true, weatherNewYork)
            }
            
        }
        task.resume()
    }
 
    static func getWeatherImage(_ weather: WeatherStruct, completionHandler: @escaping (UIImage?) -> Void) {
        let icon = weather.weather[0].icon
        let urlofImageToDownload = "http://openweathermap.org/img/wn/\(icon)@2x.png"
        guard let url = URL(string: urlofImageToDownload) else{
            return completionHandler(nil)
        }
        let session = URLSession(configuration: URLSessionConfiguration.default)
        session.dataTask(with: url, completionHandler: { (data, response, error) in

            DispatchQueue.main.async{
                if let data = data,
                    let image = UIImage(data: data) {
                    completionHandler(image)
                } else {
                    completionHandler(nil)
                }
            }
        }).resume()
        }
    
       private static let weatherMarseille = URL(string:"https://api.openweathermap.org/data/2.5/weather?q=Marseille&appid=a2d085cb1033204cd44ff5eb3bfd210a")!
    
    static func getWeatherFromMarseille(completionHandler: @escaping (Bool, WeatherStruct?) -> Void){
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: weatherMarseille){(data, response, error) in
            
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    return completionHandler(false, nil)
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    return completionHandler(false, nil)
                }
                
                guard let weatherMarseille = try? JSONDecoder().decode(WeatherStruct.self, from: data) else {
                    return completionHandler(false, nil)
                }
                
                return completionHandler(true, weatherMarseille)
            }
            
        }
        task.resume()
        
    }
    
    
}

