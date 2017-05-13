//
//  WhackAFrogUITests.swift
//  WhackAFrogUITests
//
//  Created by Matan on 13/04/2017.
//  Copyright © 2017 Matan. All rights reserved.
//

import XCTest

class WhackAFrogUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func mynewtest()  {
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
        func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
            
            //let app = XCUIApplication()
            //            app.alerts["Intro"].buttons["Lets do this!"].tap()
            //            app.buttons["Easy"].tap()
            //
            //            let cellsQuery = app.collectionViews.cells
            //            cellsQuery.otherElements.containing(.image, identifier:"Gavin-Belson").element.tap()
            //            cellsQuery.otherElements.containing(.image, identifier:"richard").element.tap()
            //            cellsQuery.otherElements.containing(.image, identifier:"peterGregory").element.tap()
            //            app.buttons["Close"].tap()
            //            XCUIDevice.shared().orientation = .faceUp
            

    }
    
}
