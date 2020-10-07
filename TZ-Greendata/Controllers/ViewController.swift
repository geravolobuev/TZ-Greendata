//
//  ViewController.swift
//  TZ-Greendata
//
//  Created by MAC on 07.10.2020.
//  Copyright © 2020 Gera Volobuev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var person: Person!
    var imageArray = [Picture]()
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var birthAndAge: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var time: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    func updateUI() {
        let imageView = UIImageView()
        imageView.imageFromServerURL(self.person.picture.medium, placeHolder: nil)
        self.mainImage.image = imageView.image
        self.name.text = self.person.name.fullName
        self.gender.text = self.person.gender
        self.birthAndAge.text = self.person.dob.formatted
        self.email.text = self.person.email
        self.time.text = "local time \(self.person.location.timezone.local)"
    }
}

