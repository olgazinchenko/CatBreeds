//
//  Colors.swift
//  CatBreeds
//
//  Created by ozinchenko.dev on 29/12/2022.
//  Copyright © 2022 Olga. All rights reserved.
//

import UIKit

public struct Colors {
    
    static let black = UIColor(red: 34/255, green: 40/255, blue: 49/255, alpha: 1.0)
    static let grey = UIColor(red: 57/255, green: 62/255, blue: 70/255, alpha: 1.0)
    static let tial = UIColor(red: 0/255, green: 172/255, blue: 181/255, alpha: 1.0)
    static let space = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
    
    static func changeDefaults() {
        UITabBar.appearance().barTintColor = space
        UITabBar.appearance().backgroundColor = space
        UITabBar.appearance().tintColor = tial
        UITableView.appearance().backgroundColor = space
        UITableViewCell.appearance().backgroundColor = space
        _ = [.normal, .selected].map {
            UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: tial, NSAttributedString.Key.font: Fonts.subheading], for: $0)
        }
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: tial, NSAttributedString.Key.font: Fonts.heading]
        _ = [.normal, .selected].map {
            UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: tial, NSAttributedString.Key.font: Fonts.subheading], for: $0)
        }
    }
}
