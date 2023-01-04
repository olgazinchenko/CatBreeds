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
        table.backgroundColor = Colors.space
        return table
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colors.space
        addSubview(breedTable)
        
        // MARK: Constraints
        breedTable.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).activate()
        breedTable.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()
        breedTable.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
        breedTable.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).activate()
    }
    
    func setupTable(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        breedTable.dataSource = dataSource
        breedTable.delegate = delegate
        breedTable.register(BreedTableCell.self, forCellReuseIdentifier: "\(BreedTableCell.self)")
    }
}
