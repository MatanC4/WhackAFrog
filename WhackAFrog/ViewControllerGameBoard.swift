//
//  ViewController.swift
//  WhackAFrog
//
//  Created by Matan on 13/04/2017.
//  Copyright © 2017 Matan. All rights reserved.
//

import UIKit

class ViewControllerGameBoard: UIViewController , UICollectionViewDataSource ,UICollectionViewDelegate {
   
    @IBAction func closeBtn(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {});
    }
    @IBOutlet weak var scoreCounter: UILabel!
    @IBOutlet weak var missCounter: UILabel!
    @IBOutlet weak var hitsCounter: UILabel!
    @IBOutlet weak var headerForData: UICollectionReusableView!
    @IBOutlet weak var scoreCount: UILabel!
    @IBOutlet weak var navBar: UINavigationItem!
    
    var hits:Int = 0
    var miss:Int = 0

    var gameLevel: Int!
    var Timer: NSTimer!
    var xPos :Int! = 1
    var yPos :Int! = 1
    
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
        print("game level is \(gameLevel)")

    }
    
    
    override func viewDidAppear(animated: Bool) {
        setTimer()
    }
    
    func setTimer(){
        var interval:Double
        interval = 1.5/Double(gameLevel)
        Timer = NSTimer.scheduledTimerWithTimeInterval(interval, target: self, selector: #selector(ViewControllerGameBoard.OnTimerTick), userInfo: nil, repeats: true)
    }
    
    func setNewXY(){
        xPos = Int(arc4random_uniform(UInt32(numOfItemsInRow)))
        var tempY = Int(arc4random_uniform(UInt32(numOfRows)))
        while yPos == tempY {
            tempY = Int(arc4random_uniform(UInt32(numOfRows)))
        }
        yPos = tempY
    }
    

    func OnTimerTick() {
        hidePreviousImage()
        setNewXY()
        let index = NSIndexPath(forRow: xPos, inSection: yPos)
        let cell = CollectionViewGameBoard.cellForItemAtIndexPath(index) as! MyCollectionViewCell
        cell.flipCell()
    }
    
    func hidePreviousImage()  {
        let index = NSIndexPath(forRow: xPos, inSection: yPos)
        let cell = CollectionViewGameBoard.cellForItemAtIndexPath(index) as! MyCollectionViewCell
        if cell.fliped{
            incMiss()
        }
        cell.setDefaultImage()
    }
    
    func incHit(){
        hits+=1
        hitsCounter.text = "\(hits)"
        if hits==8 {
            showWinnerAlert()
        }
    }
    
    func incMiss(){
        miss+=1
        missCounter.text = "\(miss)"
        if miss==3 {
           showLoserAlert()

        }
    }
    
        
    func showWinnerAlert()  {
        let alert = UIAlertController(title: "Nice", message: "Well Done! you made \(hits) hits", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "NEXT PLEASE", style: UIAlertActionStyle.Cancel, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        Timer.invalidate()
    }
    
    func showLoserAlert(){
        let alert = UIAlertController(title: "Loser", message: " you missed \(miss) times.. \u{1F425} ", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "try again", style: UIAlertActionStyle.Cancel, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        Timer.invalidate()

    }
    

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = CollectionViewGameBoard.cellForItemAtIndexPath(indexPath) as! MyCollectionViewCell
        if cell.fliped {
            incHit()
            cell.setDefaultImage()
        }
        
        
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
        //cell.replaceImage(0)
        cell.setDefaultImage()
        cell.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0)
        print("image should be set now")
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


