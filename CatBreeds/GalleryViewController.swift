//
//  ThirdViewController.swift
//  CatBreeds
//
//  Created by Olga on 15.05.2020.
//  Copyright © 2020 Olga. All rights reserved.
//

import UIKit

class GalleryViewController: UICollectionViewController {

    @IBOutlet var galleryCollectionView: UICollectionView!
    
    var breedId: Breeds?
    
    let catPhotoGallery: [UIImage] = [UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!, UIImage(named: "fun_dog")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catPhotoGallery.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GallaryCollectionViewCell
        cell.galleryCatImage.image = catPhotoGallery[indexPath.item]
        return cell
    }

}
