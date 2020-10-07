//
//  CollectionTableViewCell.swift
//  TZ-Greendata
//
//  Created by MAC on 07.10.2020.
//  Copyright © 2020 Gera Volobuev. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCell(with flat: Person){
        let imageView = UIImageView()
        imageView.imageFromServerURL(flat.picture.medium, placeHolder: nil)
        self.photo.image = imageView.image?.alpha(1)
        self.name.text = flat.name.fullName
        }
    
}
