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
    var firstLaunch: Bool = true
    enum GameLevel: Int {
        case easy = 1 , medium ,hard
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ViewControllerGameBoard
        firstLaunch = false
        switch segue.identifier! {
            case "easySeg":
                controller.gameLevel = GameLevel.easy.rawValue
                print( GameLevel.easy.rawValue )
                break
            case "mediumSeg":
                controller.gameLevel = GameLevel.medium.rawValue
                print("Medium game begins")
                break
            case "hardSeg":
                controller.gameLevel = GameLevel.hard.rawValue
                print("Hard game begins")
                break
            default:
                return
            }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.levelBtnEasy?.layer.cornerRadius = 10
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if firstLaunch{
        showWelcomeAlert()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showWelcomeAlert(){
        let alert = UIAlertController(title: "Intro", message: "We are playing whack a frog in Silicon Valley style! \n All you need to do is make sure you hit the faces before they turn back to hats..", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Lets do this!", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }



}

