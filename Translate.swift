//
//  Translate.swift
//  Projet 9
//
//  Created by Michael Aidan on 19/04/2020.
//  Copyright © 2020 Michael Aidan. All rights reserved.
//

import Foundation
struct Translate: Codable {
    var data:Data
}

struct Data: Codable {
    var translations: [TranslateTexResponseTranslation]
   
}

struct TranslateTexResponseTranslation:Codable {
    var translatedText: String
}
