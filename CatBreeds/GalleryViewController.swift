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
    
    struct Item {
        var imageName: String
    }
    
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    let cellIdentifier = "PhotoCollectionViewCell"
    let imageViewerIdentifier = "imageViewerIdentifier"
    let catPhotos: [Item] = [Item(imageName: "fun_dog"),
                             Item(imageName: "cat_1"),
                             Item(imageName: "cat_2"),
                             Item(imageName: "cat_3"),
                             Item(imageName: "cat_4"),
                             Item(imageName: "cat_1"),
                             Item(imageName: "fun_dog"),
                             Item(imageName: "cat_2"),
                             Item(imageName: "cat_3"),
                             Item(imageName: "fun_dog"),
                             Item(imageName: "cat_4"),
                             Item(imageName: "cat_3"),
                             Item(imageName: "cat_1")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let item = sender as! Item
        
        if segue.identifier == imageViewerIdentifier {
            if let viewController = segue.destination as? ImageViewerViewController {
                viewController.imageName = item.imageName
            }
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewCellSize()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        let nib = UINib(nibName: "PhotoCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    private func setupCollectionViewCellSize() {
        if collectionViewFlowLayout == nil {
            let numberItemsPerRow: CGFloat = 2
            let lineSpasing: CGFloat = 5
            let interItemSpasing: CGFloat = 5
            
            let width = (collectionView.frame.width - (numberItemsPerRow - 1) * interItemSpasing) / numberItemsPerRow
            let height = width
            
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = lineSpasing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpasing
            
            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catPhotos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! PhotoCollectionViewCell
        cell.catImage.image = UIImage(named: catPhotos[indexPath.item].imageName)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = catPhotos[indexPath.item]
        performSegue(withIdentifier: imageViewerIdentifier, sender: item)
    }

}
