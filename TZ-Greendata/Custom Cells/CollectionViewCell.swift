//
//  CollectionViewCell.swift
//  TZ-Greendata
//
//  Created by MAC on 07.10.2020.
//  Copyright © 2020 Gera Volobuev. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with string: String) {
        DispatchQueue.main.async {
            let imgUrl = string
            let imageView = UIImageView()
            imageView.imageFromServerURL(imgUrl, placeHolder: nil)
            if let finalImage = imageView.image {
                print(finalImage)
                self.image.image = finalImage
            }
            
        }
        
    }
}
