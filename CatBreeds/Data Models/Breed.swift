//
//  Breed.swift
//  CatBreeds
//
//  Created by Olga on 15.05.2020.
//  Copyright © 2020 Olga. All rights reserved.
//

import UIKit
import Foundation

class Breed: Codable {
    let id: String
    let name: String
    let temperament: String
    
    init(id: String, name: String, temperament: String) {
        self.id = id
        self.name = name
        self.temperament = temperament
    }
}
