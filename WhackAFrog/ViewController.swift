//
//  ViewController.swift
//  WhackAFrog
//
//  Created by Matan on 13/04/2017.
//  Copyright © 2017 Matan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func levelBtnEasy(sender: AnyObject) {
        print("easy level will begin")
    }
    
   
    
    @IBAction func levelBtnMedium(sender: UIButton) {
        print("Medium level will begin")
        performSegueWithIdentifier("gameBoardSegue", sender: self)
        
    }
  
    
    
    @IBAction func levelBtnHard(sender: UIButton) {
    }
       
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

