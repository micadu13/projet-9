//
//  WeatherVC.swift
//  Projet 9
//
//  Created by Michael Aidan on 31/03/2020.
//  Copyright © 2020 Michael Aidan. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var weather = WeatherService(session: URLSession(configuration: .default))

        weather.getWeatherFromNewYork(completionHandler: { (success, weatherNewYork) in
            if let tempinNY = weatherNewYork?.main.temp {
                let tempInCelsiusInNY = tempinNY-273.5
                self.temperature_NY.text = String(format: "%.2f °C", tempInCelsiusInNY)
            }
            
            if let descriptioninNY = weatherNewYork?.weather[0].main {
                self.description_newyork.text = descriptioninNY
            }
            
            if let weatherNewYork = weatherNewYork{
                weather.getWeatherImage(weatherNewYork) { (image) in
                               self.icon_ny.image = image
                           }
            }
 
   })
 
        weather.getWeatherFromMarseille(completionHandler: { (success, weatherMarseille) in
            if let tempinMrs = weatherMarseille?.main.temp {
                     let tempInCelsiusInMrs = tempinMrs-273.5
                     self.temperature_mrs.text = String(format: "%.2f °C", tempInCelsiusInMrs)
                 }
                 
            if let description_mrs = weatherMarseille?.weather[0].main{
                     self.description_mrs.text = "\(description_mrs)"
                 }
            if let weatherMarseille = weatherMarseille{
                weather.getWeatherImage(weatherMarseille) { (image) in
                    self.icon_mrs.image = image
                }
            }
            
        })
   
    }
 
            
    @IBOutlet weak var description_newyork: UITextField!
    
    @IBOutlet weak var temperature_NY: UITextField!
    
    @IBOutlet weak var icon_ny: UIImageView!
    
    
    @IBOutlet weak var description_mrs: UITextField!
    
    @IBOutlet weak var temperature_mrs: UITextField!
    
    @IBOutlet weak var icon_mrs: UIImageView!
    
    
}
