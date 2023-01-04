//
//  MainTabBarVC.swift
//  CatBreeds
//
//  Created by ozinchenko.dev on 28/12/2022.
//  Copyright © 2022 Olga. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    internal static let tabs = ["Breeds", "Quiz", "Gallery"]
    
    init() {
        super.init(nibName: nil, bundle: nil)
        let breedsViewController = UINavigationController(rootViewController: BreedsViewController())
        breedsViewController.tabBarItem = UITabBarItem(title: MainTabBarViewController.tabs[0], image: UIImage(systemName: "list.bullet"), selectedImage: nil)
        let quizViewController = QuizViewController()
        quizViewController.tabBarItem = UITabBarItem(title: MainTabBarViewController.tabs[1], image: UIImage(systemName: "gamecontroller.fill"), selectedImage: nil)
        let galleryViewController = GalleryViewController()
        galleryViewController.tabBarItem = UITabBarItem(title: MainTabBarViewController.tabs[2], image: UIImage(systemName: "square.grid.3x2.fill"), selectedImage: nil)
        viewControllers = [breedsViewController, quizViewController, galleryViewController]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
