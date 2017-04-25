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
    var gameLevel: Int!
    
    @IBOutlet weak var CollectionViewGameBoard: UICollectionView!
    
    // data source
    private let paddingsFromBothSide: CGFloat = 10.0
    private let cellWidth:CGFloat = 80.0
    private var numOfRows: Int = 0
    private var numOfItemsInRow: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        drawBoard()
        self.CollectionViewGameBoard.dataSource = self
        self.CollectionViewGameBoard.delegate = self
        
    }
    
    func drawBoard() {
        let screenSize = CollectionViewGameBoard.layer.preferredFrameSize()
        print(CollectionViewGameBoard.layer.preferredFrameSize())
        //let screenSize = UIScreen.mainScreen().bounds
        let gameBoardWidth = screenSize.width
        let gameBoardHeight = screenSize.height
        print(gameBoardWidth)
        print(gameBoardHeight)
        numOfItemsInRow = Int((gameBoardHeight)/(cellWidth + paddingsFromBothSide))
        if numOfItemsInRow>6 {
           numOfItemsInRow = 6
        }
        numOfRows = Int((gameBoardWidth)/cellWidth + paddingsFromBothSide)
        if numOfRows > 3 {
            print("num of rows was lowered to 3")
            numOfRows = 3
        }

        print(numOfItemsInRow)
        print(numOfRows)
        
        //startGame()
//
//        //updateScoreView()
//        //updateHitsView()
//        //updateMissesView()
        
//        let screenHeight = UIScreen.mainScreen().bounds.size.height
//    
//        switch (screenHeight) {
//            
//        // iPhone 4s
//        case 480:
//            
//            break;
//            
//        // iPhone 5s
//        case 568:
//            
//            break;
//            
//        // iPhone 6
//        case 667:
//            print("detected iPhone 6")
//            numOfItemsInRow = 6
//            numOfRows = 3
//            break;
//            
//        // iPhone 6 Plus
//        case 736:
//            print("detected iPhone 6 plus")
//            numOfItemsInRow = 6
//            numOfRows = 4
//            break;
//            
//        default:
//            // it's an iPad
//            
//            break;
//        }
//        
//        return
    }


    
    //func startGame(parameters)  {
        
    //}

    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numOfItemsInRow
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return numOfRows
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("boardCell", forIndexPath: indexPath) as! MyCollectionViewCell
        cell.replaceImage(0)
        print("image should be set now")
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


