//
//  ThirdViewController.swift
//  CatBreeds
//
//  Created by Olga on 15.05.2020.
//  Copyright © 2020 Olga. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {
    
    var quizView: GalleryView {
        return view as! GalleryView
    }
    
    override func loadView() {
        view = GalleryView(frame: UIScreen.main.bounds)
    }
}
//extension UIImageView {
//    
//    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
//        contentMode = mode
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard
//                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
//                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
//                let data = data, error == nil,
//                let image = UIImage(data: data)
//                else { return }
//            DispatchQueue.main.async() { [weak self] in
//                self?.image = image
//            }
//        }.resume()
//    }
//    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
//        guard let url = URL(string: link) else { return }
//        downloaded(from: url, contentMode: mode)
//    }
//}
//
//class GalleryViewController: UICollectionViewController {
//
//    @IBOutlet var galleryCollectionView: UICollectionView!
//
//    var collectionViewFlowLayout: UICollectionViewFlowLayout!
//    let cellIdentifier = "PhotoCollectionViewCell"
//    let imageViewerIdentifier = "imageViewerIdentifier"
//    
//    var photos = [Photo]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupCollectionView()
//        photoParsingFromJSON()
//    }
//    
//    func photoParsingFromJSON(){
//        let url = URL(string: "https://api.thecatapi.com/v1/images/search?limit=100")
//        URLSession.shared.dataTask(with: url!) { (data, response, error) in
//            if error == nil {
//                do {
//                    self.photos = try JSONDecoder().decode([Photo].self, from: data!)
//                }catch {
//                    print("Photo parsing error!")
//                }
//                DispatchQueue.main.async {
//                    self.collectionView.reloadData()
//                }
//            }
//        }.resume()
//    }
//    
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        setupCollectionViewCellSize()
//    }
//    
//    private func setupCollectionView() {
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        let nib = UINib(nibName: "PhotoCollectionViewCell", bundle: nil)
//        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
//    }
//    
//    private func setupCollectionViewCellSize() {
//        if collectionViewFlowLayout == nil {
//            let numberItemsPerRow: CGFloat = 3
//            let lineSpasing: CGFloat = 5
//            let interItemSpasing: CGFloat = 5
//            let width = (collectionView.frame.width - (numberItemsPerRow - 1) * interItemSpasing) / numberItemsPerRow
//            let height = width
//            collectionViewFlowLayout = UICollectionViewFlowLayout()
//            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
//            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
//            collectionViewFlowLayout.scrollDirection = .vertical
//            collectionViewFlowLayout.minimumLineSpacing = lineSpasing
//            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpasing
//            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
//        }
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return photos.count
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! PhotoCollectionViewCell
//        cell.catImage.downloaded(from: photos[indexPath.row].url)
//        return cell
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let selectedPhotoURL = photos[indexPath.row].url
//        performSegue(withIdentifier: imageViewerIdentifier, sender: selectedPhotoURL)
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == imageViewerIdentifier {
//            let destViewController: ImageViewerViewController = segue.destination as! ImageViewerViewController
//            destViewController.stringURL = sender as? String ?? ""
//        }
//    }
//}
