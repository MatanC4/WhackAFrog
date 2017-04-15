//
//  ViewController.swift
//  WhackAFrog
//
//  Created by Matan on 13/04/2017.
//  Copyright © 2017 Matan. All rights reserved.
//

import UIKit

class CollectionViewControllerGame: UICollectionViewController {
    
    @IBOutlet var scoreHeader: [UICollectionReusableView]!
    
    @IBOutlet weak var scoreCount: UILabel!
    @IBOutlet weak var missCount: UILabel!
    @IBOutlet weak var hitsCount: UILabel!
 
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 4
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    private struct Storyboard{
        static let  cellidentifier = "boardCell"
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Storyboard.cellidentifier, forIndexPath: indexPath) as UICollectionViewCell
       
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


