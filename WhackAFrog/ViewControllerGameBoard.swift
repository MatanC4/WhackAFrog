//
//  ViewController.swift
//  WhackAFrog
//
//  Created by Matan on 13/04/2017.
//  Copyright © 2017 Matan. All rights reserved.
//

import UIKit
import AudioToolbox
class ViewControllerGameBoard: UIViewController , UICollectionViewDataSource ,UICollectionViewDelegate {
 
    @IBOutlet weak var dataView: UIView!

    @IBAction func closeBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var hitsCounter: UILabel!
  
    @IBOutlet weak var missCounter: UILabel!
    
    @IBOutlet weak var scoreCounter: UILabel!
 
    var hits:Int = 0
    var miss:Int = 0
    var score:Int = 0

    var gameLevel: Int!
    var timer: Timer!
    var xPos: Int! = 1
    var yPos:Int! = 1
    
    @IBOutlet weak var CollectionViewGameBoard: UICollectionView!
    private var numOfRows: Int = 0
    private var numOfItemsInRow: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        drawBoard()
        self.CollectionViewGameBoard.dataSource = self
        self.CollectionViewGameBoard.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let orientationValue = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(orientationValue, forKey: "orientation")
        setTimer()
    }
    
    func setTimer(){
        var interval:Double
        interval = 1.5/Double(gameLevel)
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
        let cell = CollectionViewGameBoard.cellForItem(at: IndexPath(row: xPos, section:yPos)) as! MyCollectionViewCell
        cell.flipCell()
    }
    
    func hidePreviousImage()  {
        let cell = CollectionViewGameBoard.cellForItem(at: IndexPath(row: xPos, section:yPos)) as! MyCollectionViewCell

        if cell.fliped{
            incMiss()
        }
        cell.setDefaultImage()
    }
    

    
    func incScore(){
        score += 3
        scoreCounter.text = "\(score)"
        if score == 30  {
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "backToMain" {
                let controller = segue.destination as! WelcomeScreenViewController
                controller.firstLaunch = false
        }
    }
    
    func showWinnerAlert()  {
        let alert = UIAlertController(title: "Nice", message: "Well Done! you made \(hits) hits", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "NEXT PLEASE", style: UIAlertActionStyle.default, handler: { action in self.dismiss(animated: true, completion: nil)}))
        self.present(alert, animated: true, completion: nil)
        timer.invalidate()
    }
    
    func showLoserAlert(){
        let alert = UIAlertController(title: "Loser", message: " you missed \(miss) times.. \u{1F425} ", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "try again", style: UIAlertActionStyle.default, handler: { action in self.dismiss(animated: true, completion: nil)}))
        self.present(alert, animated: true, completion:nil)
        timer.invalidate()
    }
    
    
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        let cell = CollectionViewGameBoard.cellForItem(at: indexPath) as! MyCollectionViewCell
        if cell.fliped {
            hits += 1
            incScore()
            cell.setDefaultImage()
        }
    }
    
    func drawBoard() {
        let screenHeight = UIScreen.main.bounds.size.height
        switch (screenHeight) {
            
        // iPhone 5*
        case 568:
            numOfItemsInRow = 3
            numOfRows = 5
            break;
        // iPhone 6*
        case 667:
            numOfItemsInRow = 4
            numOfRows = 6
            break;
        // iPhone  Plus
        case 736:
            numOfItemsInRow = 4
            numOfRows = 7
            break;
        default:
            numOfItemsInRow = 3
            numOfRows = 5
                break;
        }
        return
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numOfItemsInRow
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numOfRows
    }
    
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "boardCell", for: indexPath) as! MyCollectionViewCell
        cell.setDefaultImage()
        cell.backgroundColor = UIColor.white.withAlphaComponent(0)
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   }


