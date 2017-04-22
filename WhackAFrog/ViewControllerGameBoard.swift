//
//  ViewController.swift
//  WhackAFrog
//
//  Created by Matan on 13/04/2017.
//  Copyright © 2017 Matan. All rights reserved.
//

import UIKit

class ViewControllerGameBoard: UIViewController , UICollectionViewDataSource ,UICollectionViewDelegate {
   
    @IBOutlet weak var headerForData: UICollectionReusableView!
    @IBOutlet weak var scoreCount: UILabel!
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var missCount: UILabel!
    @IBOutlet weak var hitsCount: UILabel!
    //@IBOutlet var scoreHeader: [UICollectionReusableView]!
    var gameLevel: Int!
    
    @IBOutlet weak var CollectionViewGameBoard: UICollectionView!
    
    // data source
    private let paddingsFromBothSide: CGFloat = 20.0
    private let cellWidth: CGFloat = 100.0
    private var numOfRows: Int = 0
    private var numOfItemsInRow: Int = 0



    
    
    
//    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
//        print(gameLevel)
//        return 4
//        
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawBoard()
        self.CollectionViewGameBoard.dataSource = self
        self.CollectionViewGameBoard.delegate = self
        
    }
    
    func drawBoard() {
        
        let screenSize = UIScreen.mainScreen().bounds
        let gameBoardWidth = screenSize.width
        let gameBoardHeight = screenSize.height
       // let gameBoardWidth = CollectionViewGameBoard.collectionViewLayout.collectionViewContentSize().width
        print(gameBoardWidth)
        //let gameBoardHeight: CGFloat = 581.0
        //let gameBoardHeight = CollectionViewGameBoard.collectionViewLayout.collectionViewContentSize().height
        print(gameBoardHeight)
        numOfRows = Int((gameBoardHeight) / (cellWidth + paddingsFromBothSide))
        print(numOfRows)
        numOfItemsInRow = Int((gameBoardWidth)/(paddingsFromBothSide + cellWidth))
        print(numOfItemsInRow)
        
        
        //width/(collection view cell width + padding) = number of
        
       
        
        
        
        //updateScoreView()
        //updateHitsView()
        //updateMissesView()
}
    
    
    func numberOfSectionsInCollectionView(in collectionView: UICollectionView) -> Int {
        return 4 //numOfItemsInRow
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4 //numOfRows
    }
    
    private struct Storyboard{
        static let  cellidentifier = "boardCell"
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("boardCell", forIndexPath: indexPath) as UICollectionViewCell
        //cell.backgroundColor = UIColor.blueColor()
        //cell.setDfaultImage()
        print("image should be set now")
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


