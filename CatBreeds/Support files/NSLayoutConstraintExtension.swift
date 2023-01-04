//
//  NSLayoutConstraintExtension.swift
//  CatBreeds
//
//  Created by ozinchenko.dev on 30/12/2022.
//  Copyright © 2022 Olga. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
    @discardableResult func activate() -> NSLayoutConstraint {
        isActive = true
        return self
    }
}
