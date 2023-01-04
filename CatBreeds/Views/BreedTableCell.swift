//
//  BreedTableCell.swift
//  CatBreeds
//
//  Created by Olga on 15.05.2020.
//  Copyright © 2020 Olga. All rights reserved.
//

import UIKit

class BreedTableCell: UITableViewCell {

//    var breedNameLabel = {
//        var label = UILabel()
//        label.textColor = Colors.black
//        return label
//    }()
    @UsesAutoLayout
    var name: UILabel = {
        let name = UILabel()
        name.textColor = Colors.black
        name.font = Fonts.body
        return name
      }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(name)
        
        //MARK: Constrains
        name.centerYAnchor.constraint(equalTo: centerYAnchor).activate()
        name.leadingAnchor.constraint(equalTo: leadingAnchor).activate()
    }
    
    func configure(labelName: String) {
        self.name.text = labelName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
