//
//  MyCollectionViewCell.swift
//  WhackAFrog
//
//  Created by Matan on 22/04/2017.
//  Copyright © 2017 Matan. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var MyImageView: UIImageView!
    
    let defaultImage = UIImage(named: "ErlichBachman")!
    
    
    
    func setDfaultImage()  {
        MyImageView.image = defaultImage
    }
    
    
    
}
