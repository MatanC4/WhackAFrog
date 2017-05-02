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
    var imageArr: [UIImage] = [UIImage(named: "erlich")!,
                                 UIImage(named: "richard")!,
                                 UIImage(named: "jared")!,
                                 UIImage(named: "bighead")!,
                                 UIImage(named: "gilfoyle")!,
                                 UIImage(named: "Gavin-Belson")!,
                                 UIImage(named: "lori")!,
                                 UIImage(named: "peterGregory")!,
                                 UIImage(named: "monica")!]
    
    
    
    var defaultImage: UIImage = UIImage(named:"ppIcon")!

    var fliped:Bool = false
    
    //let defaultImage = UIImage(named: "ErlichBachman")
    
    
    func flipCell(){
        fliped = true
        let randomIndex = Int(arc4random_uniform(UInt32(imageArr.count)))
        MyImageView?.image = imageArr[randomIndex]

    }
    
    func setDefaultImage()  {
        fliped = false
        MyImageView?.image = defaultImage
    }
    
    func replaceImage() {
        let randomIndex = Int(arc4random_uniform(UInt32(imageArr.count)))
        MyImageView?.image = imageArr[randomIndex]
    }
    
    
    
    
}
