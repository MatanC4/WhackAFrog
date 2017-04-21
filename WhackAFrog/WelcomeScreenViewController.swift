//
//  ViewController.swift
//  WhackAFrog
//
//  Created by Matan on 13/04/2017.
//  Copyright © 2017 Matan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var levelBtnEasy: UIButton!
    @IBOutlet var levelBtnMedium: UIButton!
    @IBOutlet var levelBtnHard: UIButton!

    enum GameLevel: Int {
        case Easy = 1 , Medium ,Hard
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! CollectionViewControllerGame
            switch segue.identifier! {
            case "easySegue":
                controller.gameLevel = GameLevel.Easy.rawValue
                print("Easy game begins")
            case "mediumSegue":
                controller.gameLevel = GameLevel.Medium.rawValue
                print("Medium game begins")
            case "hardSegue":
                controller.gameLevel = GameLevel.Hard.rawValue
                print("Hard game begins")
            default:
                return
            }
    }
    
    

         
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
       self.levelBtnEasy?.layer.cornerRadius = 10
        print(self.levelBtnEasy?.layer.cornerRadius.hashValue)
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

