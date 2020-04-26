//
//  Translate.swift
//  Projet 9
//
//  Created by Michael Aidan on 29/03/2020.
//  Copyright © 2020 Michael Aidan. All rights reserved.
//

import Foundation
import UIKit
class TranslateService {
    
   // let text = tvc.gettapedtext()
    private static let getUrl = URL(string: "https://translation.googleapis.com/language/translate/v2")!
 
    static func gettranslation(textToTranslate: String, completionHandler: @escaping (Bool, Translate?)-> Void){
        var request = URLRequest(url: getUrl)
        request.httpMethod = "POST"
        
        let body = "method=getUrl&q=\(textToTranslate)&target=en&format=html&source=fr&key=AIzaSyDgN3bWGkzCyhNSr0v4dRNH83tP7Xa5LSk"
        request.httpBody = body.data(using: .utf8)
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: request) {(data, response, error) in
            
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                               return completionHandler(false, nil)
                           }
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                               return completionHandler(false, nil)
                           }
                guard let translate = try? JSONDecoder().decode(Translate.self, from: data) else {
                               return completionHandler(false, nil)
                           }
                           return completionHandler(true, translate)
            }
           
            
        }
        task.resume()
    }
    
}
