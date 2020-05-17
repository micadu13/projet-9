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
        
        WeatherService.getWeatherFromNewYork(completionHandler: { (success, weatherNewYork) in
            if let tempinNY = weatherNewYork?.main.temp {
                let tempInCelsiusInNY = ((Int(tempinNY)-32)*(5/9))
                self.temperature_NY.text = "\(tempinNY)"
            }
            return
            
            if let descriptioninNY = weatherNewYork?.weather[0]{
                self.description_newyork.text = "\(descriptioninNY)"
            }
            return
            
            if let iconinNY = weatherNewYork?.weather[2]{
                let icontextNY = iconinNY
                //self.icon_ny.image =
 
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
