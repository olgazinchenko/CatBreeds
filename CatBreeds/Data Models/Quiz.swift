//
//  Quiz.swift
//  CatBreeds
//
//  Created by Olga on 22.05.2020.
//  Copyright © 2020 Olga. All rights reserved.
//

import Foundation

struct Quiz: Decodable {
    var url: String
    var breeds: [Breed]
}
