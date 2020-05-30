//
//  exemple_vincent.swift
//  Projet 9
//
//  Created by Michael Aidan on 21/05/2020.
//  Copyright © 2020 Michael Aidan. All rights reserved.
//
/*
import Foundation


struct City {
    var pictureUrl: String
    var map: Map
}

struct Map {
    var mapImageUrl: String
}

//Model
class CityInfoService {
    
    let urlTemplate = "https://fakeimg.pl/350x200/?text="
    
    static func getCity(with name: String, completionHandler: @escaping (City?, Error?) -> Void) {
        var city: City?
        if name == "Marseille" {
            city = City(pictureUrl: "toto",
                        map: Map(mapImageUrl: "toto"))
        } else if name == "Paris" {
            city = City(pictureUrl: "titi",
                        map: Map(mapImageUrl: "titi"))
        }
        completionHandler(city, nil)
    }
    
    static func getCityImage(_ city: City, completionHandler: @escaping (NSImage?) -> Void) {
        let urlOfImageToDownload = "https://fakeimg.pl/350x200/?text=\(city.pictureUrl)"
        guard let url = URL(string: urlOfImageToDownload) else {
            return completionHandler(nil)
        }
        let session = URLSession(configuration: URLSessionConfiguration.default)
        session.dataTask(with: url, completionHandler: { (data, response, error) in
            if let data = data, let image = NSImage(data: data) {
                completionHandler(image)
            } else {
                completionHandler(nil)
            }
            
        }).resume()
    }
}

//Controller
CityInfoService.getCity(with: "Paris") { (city, error) in
    if let city = city {
        CityInfoService.getCityImage(city) { (image) in
            let image = image
            print(image)
        }
    }
}

CityInfoService.getCity(with: "Marseille") { (city, error) in
    if let city = city {
        CityInfoService.getCityImage(city) { (image) in
            let image = image
            print(image)
        }
    }
}

CityInfoService.getCity(with: "Orleans") { (city, error) in
    if let city = city {
        CityInfoService.getCityImage(city) { (image) in
            let image = image
            print(image)
        }
    } else {
        print("Pas de city")
    }
}
*/
