//
//  ViewController.swift
//  WhackAFrog
//
//  Created by Matan on 13/04/2017.
//  Copyright © 2017 Matan. All rights reserved.
//

import UIKit

class ViewControllerGameBoard: UIViewController , UICollectionViewDataSource ,UICollectionViewDelegate {
 

   
   
    
    @IBOutlet weak var scoreCounter: UILabel!
    @IBOutlet weak var missCounter: UILabel!
    @IBOutlet weak var hitsCounter: UILabel!
    @IBOutlet weak var headerForData: UICollectionReusableView!
    @IBOutlet weak var scoreCount: UILabel!
    @IBOutlet weak var navBar: UINavigationItem!
    
    var hits:Int = 0
    var miss:Int = 0

    var gameLevel: Int!
    var timer: Timer!
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
    
    
    override func viewDidAppear(_ animated: Bool) {
        setTimer()
    }
    
    func setTimer(){
        var interval:Double
        interval = 1.5/Double(gameLevel)
        
        //Timer = Timer.scheduledTimerWithTimeInterval(interval, target: self, selector: //#selector(ViewControllerGameBoard.OnTimerTick), userInfo: nil, repeats: true)
        
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(interval), target: self, selector: #selector(ViewControllerGameBoard.OnTimerTick), userInfo: nil, repeats: true)
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

        
        //let index = NSIndexPath(forRow: xPos, inSection: yPos)
        let cell = CollectionViewGameBoard.cellForItem(at: IndexPath(row: xPos, section:yPos)) as! MyCollectionViewCell
        //let cell = CollectionViewGameBoard.cellForItemAtIndexPath(index) as! MyCollectionViewCell
        cell.flipCell()
    }
    
    func hidePreviousImage()  {
        //let index = NSIndexPath(forRow: xPos, inSection: yPos)
        let cell = CollectionViewGameBoard.cellForItem(at: IndexPath(row: xPos, section:yPos)) as! MyCollectionViewCell

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
        let alert = UIAlertController(title: "Nice", message: "Well Done! you made \(hits) hits", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "NEXT PLEASE", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        timer.invalidate()
    }
    
    func showLoserAlert(){
        let alert = UIAlertController(title: "Loser", message: " you missed \(miss) times.. \u{1F425} ", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "try again", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        timer.invalidate()

    }
    

    private func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: IndexPath) {
        let cell = CollectionViewGameBoard.cellForItem(at: indexPath as IndexPath) as! MyCollectionViewCell
        if cell.fliped {
            incHit()
            cell.setDefaultImage()
        }
        
        
    }
    
    func drawBoard() {
        //let screenSize = CollectionViewGameBoard.layer.preferredFrameSize()
        print(CollectionViewGameBoard.layer.preferredFrameSize())
        let screenSize = UIScreen.main.bounds
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
//        
//        let screenHeight = UIScreen.mainScreen().bounds.size.height
//    
//        switch (screenHeight) {
//            
//        // iPhone 4s
//        case 480:
//        print("detected iPhone 4s")
//                    numOfItemsInRow = 4
//                    numOfRows = 3
//            break;
//            
//        // iPhone 5s
//        case 568:
//        print("detected iPhone 5s")
//                    numOfItemsInRow = 4
//                    numOfRows = 3
//                    break;
//    
//        // iPhone 6
//        case 667:
//            print("detected iPhone 6")
//            numOfItemsInRow = 5
//            numOfRows = 3
//            break;
//            
//        // iPhone 6 Plus
//        case 736:
//            print("detected iPhone 6 plus")
//            numOfItemsInRow = 6
//            numOfRows = 3
//            break;
//        default:
//            // it's an iPad
//            
//            break;
//        }
//        
//        return
//        
//        
//    }
    }

    
    //func startGame(parameters)  {
        
    //}
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("numOfItemsInRow is \(numOfItemsInRow)")
        return numOfItemsInRow
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        print("numberOfSectionsInCollectionView is \(numOfRows)")
        return numOfRows
    }
    
//    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
//        print("numberOfSectionsInCollectionView")
//        
//        return numOfRows
//    }
    
    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath) as! GameCell
//        
//        return cell
//    }
    
    
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "boardCell", for: indexPath) as! MyCollectionViewCell
        cell.setDefaultImage()
        cell.backgroundColor = UIColor.white.withAlphaComponent(0)
        print("image should be set now")
        return cell
    }

    
//     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> MyCollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "boardCell", for: indexPath as IndexPath) as! MyCollectionViewCell
//        //cell.replaceImage(0)
//        cell.setDefaultImage()
//        cell.backgroundColor = UIColor.white.withAlphaComponent(0)
//        print("image should be set now")
//        return cell
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


