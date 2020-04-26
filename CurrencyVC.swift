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
    var rateToEuro: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CurrencyService.getCurrency { (success, currency) in
            if let rate = currency?.rates["USD"] {
                self.rateToDollar = rate
                self.rateToEuro = 1 / self.rateToDollar
            }
        }
    }
    
    
    
    @IBOutlet weak var currencyToBeConverted: UITextField!
   
    
    @IBAction func euroToDollar (_ sender: Any) {
    guard let from = currencyToBeConverted.text,
            let realFrom = Double(from)
            else { return }
        
        let to = realFrom * rateToDollar
        currencyConverted.text = "\(to)"
  }
    
    @IBAction func dollarToEuro(_ sender: Any) {
        guard let from = currencyToBeConverted.text,
        let realFrom = Double(from)
        else { return }
        
        let to = realFrom * rateToEuro
        currencyConverted.text = "\(to)"
        
    }
    
    
    
    @IBOutlet var currencyConverted: UITextField!
    
}
    
 
