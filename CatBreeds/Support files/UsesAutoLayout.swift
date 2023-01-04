//
//  UsesAutoLayout.swift
//  CatBreeds
//
//  Created by ozinchenko.dev on 30/12/2022.
//  Copyright © 2022 Olga. All rights reserved.
//

import UIKit

@propertyWrapper
public struct UsesAutoLayout<T: UIView> {
    public var wrappedValue: T {
        didSet {
            wrappedValue.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
        wrappedValue.translatesAutoresizingMaskIntoConstraints = false
    }
}
