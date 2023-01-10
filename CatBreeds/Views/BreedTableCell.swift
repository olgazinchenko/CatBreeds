//
//  BreedTableCell.swift
//  CatBreeds
//
//  Created by Olga on 15.05.2020.
//  Copyright © 2020 Olga. All rights reserved.
//

import UIKit

class BreedTableCell: UITableViewCell {
    @UsesAutoLayout
    var photo: UIImageView = {
        var photo = UIImageView()
        photo.contentMode = .scaleAspectFit
        return photo
    }()
    @UsesAutoLayout
    var name: UILabel = {
        let name = UILabel()
        name.textColor = Colors.grey
        name.font = Fonts.body
        return name
      }()
    
    internal static let thumbnailHeightWidth: CGFloat = 44.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(photo)
        addSubview(name)
        
        //MARK: Constrains
        photo.centerYAnchor.constraint(equalTo: centerYAnchor).activate()
        photo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8.0).activate()
        photo.heightAnchor.constraint(equalToConstant: BreedTableCell.thumbnailHeightWidth).activate()
        photo.widthAnchor.constraint(equalToConstant: BreedTableCell.thumbnailHeightWidth).activate()
        name.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 4.0).activate()
        name.centerYAnchor.constraint(equalTo: centerYAnchor).activate()
    }
    
    func configure(name: String, photo: UIImage) {
        self.name.text = name
        self.photo.image = photo
 //       BreedTableCell.appearance().backgroundColor = Colors.space
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
