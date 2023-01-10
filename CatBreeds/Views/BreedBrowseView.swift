//
//  BreedBrowseView.swift
//  CatBreeds
//
//  Created by ozinchenko.dev on 29/12/2022.
//  Copyright © 2022 Olga. All rights reserved.
//

import UIKit

class BreedBrowseView: UIView {
    
    @UsesAutoLayout
    
    internal var breedTable: UITableView = {
        let table = UITableView()
        table.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return table
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(breedTable)
        
        // MARK: Constraints
        breedTable.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).activate()
        breedTable.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 8.0).activate()
        breedTable.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).activate()
        breedTable.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).activate()
    }
    
    func setupTable(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        breedTable.dataSource = dataSource
        breedTable.delegate = delegate
        breedTable.register(BreedTableCell.self, forCellReuseIdentifier: "\(BreedTableCell.self)")
    }
    
    
}
