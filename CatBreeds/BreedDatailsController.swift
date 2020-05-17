//
//  BreedDatailsController.swift
//  CatBreeds
//
//  Created by Olga on 16.05.2020.
//  Copyright © 2020 Olga. All rights reserved.
//

import UIKit

class BreedDatailsController: UIViewController {
    
    @IBOutlet weak var breedNameLabel: UILabel!
    @IBOutlet weak var temperamentLabel: UILabel!
    
    var breed: Breeds?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        breedNameLabel.text = "🐱 \(breed?.name ?? "🐱")"
        temperamentLabel.text = "Temperament: \(breed?.temperament ?? "🤷‍♀️")"
       }
}
