//
//  CurrencyVC.swift
//  Projet 9
//
//  Created by Michael Aidan on 31/03/2020.
//  Copyright © 2020 Michael Aidan. All rights reserved.
//

import UIKit

class CurrencyVC: UIViewController {
    
    var rateToDollar: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CurrencyService.getCurrency { (success, currency) in
            if let rate = currency?.rates["USD"] {
                self.rateToDollar = rate
            }
        }
    }
    @IBOutlet weak var currencytobeconverted: UITextField!
   
    
    @IBAction func toconvert(_ sender: Any) {
        guard let from = currencytobeconverted.text,
            let realFrom = Double(from)
            else { return }
        
        let to = realFrom * rateToDollar
        currencyconverted.text = "\(to)"
        
    }
    
    @IBOutlet var currencyconverted: UITextField!
    
}
    
 

    
