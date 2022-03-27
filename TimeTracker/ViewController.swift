//
//  ViewController.swift
//  TimeTracker
//
//  Created by Kevin Stradtman on 3/27/22.
//

import Cocoa

class ViewController: NSViewController {

    
    @IBOutlet var goalLabel: NSTextField!
    @IBOutlet var goalTimePopUp: NSPopUpButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goalTimePopUp.removeAllItems()
        goalTimePopUp.addItems(withTitles: titles())
        updateView()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func updateView() {
        let goalTime = goalTimePopUp.indexOfSelectedItem + 1
        if goalTime == 1 {
            goalLabel.stringValue = "Goal: 1 Hour"
        } else {
            goalLabel.stringValue = "Goal: \(goalTime) Hours"
        }
    }

    @IBAction func goalTimeChangedPopUp(_ sender: Any) {
        updateView()
    }
    
    func titles() -> [String] {
        var titles = [String]()
        for number in 1...40 {
            titles.append("\(number)h")
        }
        return titles
    }
    
}

