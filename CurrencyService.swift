//
//  Currency.swift
//  Projet 9
//
//  Created by Michael Aidan on 29/03/2020.
//  Copyright © 2020 Michael Aidan. All rights reserved.
//

import Foundation
class CurrencyService {
// récuperer la donnée
    
 //access_key= 2a6f5a694e984c4510973aa428c48c67
   
    private static let currencyUrl = URL(string: "http://data.fixer.io/api/latest?access_key=2a6f5a694e984c4510973aa428c48c67&format=1")!
    
    static func getCurrency(completionHandler: @escaping (Bool, Currency?)->Void){
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: currencyUrl){(data, response, error) in
            
            guard let data = data, error == nil else {
                return completionHandler(false, nil)
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return completionHandler(false, nil)
            }
            
            guard let currency = try? JSONDecoder().decode(Currency.self, from: data) else {
                return completionHandler(false, nil)
            }
            
            return completionHandler(true, currency)
        }
        task.resume()
    }

       
   }

