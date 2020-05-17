//
//  ImageViewerViewController.swift
//  CatBreeds
//
//  Created by Olga on 17.05.2020.
//  Copyright © 2020 Olga. All rights reserved.
//

import UIKit
class ImageViewerViewController: UIViewController {
    
    @IBOutlet weak var fullImageView: UIImageView!
    
    var imageName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageView()
    }
    
    private func setupImageView() {
        guard let name = imageName else { return }
        
        if let image = UIImage(named: name) {
            fullImageView.image = image
        }
    }

}
