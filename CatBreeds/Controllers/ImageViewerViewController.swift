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
    
    var stringURL: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: stringURL)
        loadFullscreenImage(url: url!)
    }
    
    func loadFullscreenImage(url: URL) {
        DispatchQueue.global().async { [self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.fullImageView.image = image
                    }
                }
            }
        }
    }
}
