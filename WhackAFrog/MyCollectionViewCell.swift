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
    var imageArr: [UIImage] = [UIImage(named: "ErlichBachman")!,
                                 UIImage(named: "richard")!,
                                 UIImage(named: "jaredDan")!,
                                 UIImage(named: "bighead")!,
                                 UIImage(named: "gilfoyle")!]
    
    //let defaultImage = UIImage(named: "ErlichBachman")
    
    

    
    func setDefaultImage()  {
        MyImageView?.image = UIImage(named: "richard")
        print("erlich was here")
    }
    
    func replaceImage(previous:Int) {
        var randomIndex = Int(arc4random_uniform(UInt32(imageArr.count)))
        //make sure same image wont repeat
        while randomIndex == previous {
            randomIndex = Int(arc4random_uniform(UInt32(imageArr.count)))
        }
        MyImageView?.image = imageArr[randomIndex]
    }
    
    
    
}
