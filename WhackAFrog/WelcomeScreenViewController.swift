//
//  ViewController.swift
//  WhackAFrog
//
//  Created by Matan on 13/04/2017.
//  Copyright © 2017 Matan. All rights reserved.
//

import UIKit
import AVFoundation


class WelcomeScreenViewController: UIViewController {
    var firstLaunch: Bool = true
    var AudioPlayer: AVAudioPlayer!
    @IBOutlet weak var levelBtnEasy: UIButton!
    @IBOutlet weak var levelBtnMedium: UIButton!
    @IBOutlet weak var levelBtnHard: UIButton!
    enum GameLevel: Int {
        case easy = 1 , medium ,hard
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ViewControllerGameBoard
        if firstLaunch{
            AudioPlayer.stop()
        }
        firstLaunch = false
        switch segue.identifier! {
            case "easySeg":
                controller.gameLevel = GameLevel.easy.rawValue
                break
            case "mediumSeg":
                controller.gameLevel = GameLevel.medium.rawValue
                break
            case "hardSeg":
                controller.gameLevel = GameLevel.hard.rawValue
                break
            default:
                return
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        levelBtnEasy.clipsToBounds = true
        levelBtnEasy.layer.cornerRadius = 20
        levelBtnEasy.layer.borderWidth = 0.5
        
        levelBtnMedium.clipsToBounds = true
        levelBtnMedium.layer.cornerRadius = 20
        levelBtnMedium.layer.borderWidth = 0.5
        
        levelBtnHard.clipsToBounds = true
        levelBtnHard.layer.cornerRadius = 20
        levelBtnHard.layer.borderWidth = 0.5
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if firstLaunch{
        showWelcomeAlert()
        playSound()
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
    
    func playSound() {
        do {
            let bgSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "SiliconValleyRingtone", ofType: "m4r")!)
            AudioPlayer = try AVAudioPlayer(contentsOf: bgSound as URL)
            AudioPlayer.numberOfLoops = 2
            AudioPlayer.prepareToPlay()
            AudioPlayer.play()
        }
        catch {
            print(error)
        }
    }
}

