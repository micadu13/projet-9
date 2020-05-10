//
//  WeatherVC.swift
//  Projet 9
//
//  Created by Michael Aidan on 31/03/2020.
//  Copyright © 2020 Michael Aidan. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController {
 
            
    @IBOutlet weak var description_newyork: UITextField!
    
    @IBOutlet weak var temperature_NY: UITextField!
    
    @IBOutlet weak var icon_ny: UIImageView!
    
    
    @IBOutlet weak var description_mrs: UITextField!
    
    @IBOutlet weak var temperature_mrs: UITextField!
    
    @IBOutlet weak var icon_mrs: UIImageView!
    
    override func viewDidLoad() {
           super.viewDidLoad()
           WeatherService.getWeatherNewYork { (success, weatherNewYork) in
           
           }
       }
}
