//
//  Currency.swift
//  Projet 9
//
//  Created by Michael Aidan on 29/03/2020.
//  Copyright © 2020 Michael Aidan. All rights reserved.
//

import Foundation
class Currency {
   //convertir la donnée pour la passer au controleur
    //2 étapes : 1 étape quand on convertit la donnée et 1 étape quand on crée l'objet
}

// récuperer la donnée
class CurrencyService {
    func getCurrency(completionHandler: @escaping (Data?) -> Void) {
        print("tutu")
        URLSession.shared.dataTask(with: URL(string: "http://www.google.com")!) { (data, response, error) in
            print("tata")
            completionHandler(data)
        }.resume()
        print("toto")
    }
}
// euro => $
