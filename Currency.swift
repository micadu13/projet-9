//
//  Currency.swift
//  Projet 9
//
//  Created by Michael Aidan on 05/04/2020.
//  Copyright © 2020 Michael Aidan. All rights reserved.
//

import Foundation
struct Currency: Codable {
     var success: Bool
    var rates: [String: Double]
}
