//
//  FakeResponseData.swift
//  Projet 9Tests
//
//  Created by Michael Aidan on 01/06/2020.
//  Copyright © 2020 Michael Aidan. All rights reserved.
//

import Foundation
class FakeResponseDataCurrency {
   static let responseOK = HTTPURLResponse(url: URL(string: "www.google.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)!
  static  let responseKO = HTTPURLResponse(url: URL(string: "www.google.com")!, statusCode: 500, httpVersion: nil, headerFields: nil)!
    
    class CurrencyError: Error{}
    let currencyerror = CurrencyError()
    
    
   static var currencyCorrectData:Data{
        let bundlecurrency = Bundle(for: FakeResponseDataCurrency.self)
        let urlcurrency = bundlecurrency.url(forResource: "Currency", withExtension: "json")
        let datacurrency = try! Data(contentsOf: urlcurrency!)
        return datacurrency

}
   static let currencyIncorrectData = "erreur".data(using: .utf8)!
    
    
}
