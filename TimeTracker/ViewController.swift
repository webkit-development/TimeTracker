//
//  ViewController.swift
//  TimeTracker
//
//  Created by Kevin Stradtman on 3/27/22.
//

import Cocoa

class ViewController: NSViewController {

    
    @IBOutlet var currently: NSTextField!
    @IBOutlet var inButton: NSButton!
    @IBOutlet var goalLabel: NSTextField!
    @IBOutlet var goalTimePopUp: NSPopUpButton!
    
    var currentPeriod: Period?
    var timer: Timer?
    
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
        
        if currentPeriod == nil {
            inButton.title = "IN"
            currently.isHidden = true
        } else {
            inButton.title = "OUT"
            currently.isHidden = false
            currently.stringValue = "Currently: \(currentPeriod!.currentlyString())"
        }
    }

    @IBAction func goalTimeChangedPopUp(_ sender: Any) {
        updateView()
    }
    
    @IBAction func inOutTapped(_ sender: Any) {
        if currentPeriod == nil {
            if let context = (NSApp.delegate as? AppDelegate)?.persistentContainer.viewContext {
                currentPeriod = Period(context: context)
                //currentPeriod?.inDate = Date()
                currentPeriod?.inDate = Date(timeIntervalSinceNow: -14045)
            }
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { timer in
                self.updateView()
            })
        } else {
            //clocking out
            currentPeriod!.outDate = Date()
            currentPeriod = nil
            timer?.invalidate()
            timer = nil
        }
        updateView()
        (NSApp.delegate as? AppDelegate)?.saveAction(nil)
    }
    func titles() -> [String] {
        var titles = [String]()
        for number in 1...40 {
            titles.append("\(number)h")
        }
        return titles
    }
    
}

