//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Michaela Foote on 12/10/15.
//  Copyright © 2015 Michaela Foote. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultSeg: UISegmentedControl!
    
    @IBOutlet weak var defaultLabel: UILabel!
    
    @IBOutlet weak var displaySeg: UISegmentedControl!
    
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func chooseDefault(sender: AnyObject) {
        let tipPercentages = [18, 20, 22]
        let tipPercentage = tipPercentages[defaultSeg.selectedSegmentIndex]
        
        defaultLabel.text = "Default Tip is \(tipPercentage) percent"

        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(sender.selectedSegmentIndex, forKey: "default")
        defaults.synchronize()
    }
    
    @IBAction func colorSwitch(sender: AnyObject) {
        if displaySeg.selectedSegmentIndex == 0 {
            defaultLabel.textColor = UIColor.blackColor()
            displayLabel.textColor = UIColor.blackColor()
            self.view.tintColor = UIColor.purpleColor()
            self.view.backgroundColor = UIColor.whiteColor()
        }
        else {
            defaultLabel.textColor = UIColor.whiteColor()
            displayLabel.textColor = UIColor.whiteColor()
            self.view.tintColor = UIColor.yellowColor()
            self.view.backgroundColor = UIColor.grayColor()
        }
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let defTip = defaults.integerForKey("default")
        switch defTip {
        case 0...2:
            defaultSeg.selectedSegmentIndex = defTip
        default:
            defaultSeg.selectedSegmentIndex = 0
        }
        
            let stringValue = defaults.stringForKey("color")
            if (stringValue != nil) {
                if stringValue == "Light" {
                    displaySeg.selectedSegmentIndex = 0
                    defaultLabel.textColor = UIColor.blackColor()
                    displayLabel.textColor = UIColor.blackColor()
                    self.view.tintColor = UIColor.purpleColor()
                    self.view.backgroundColor = UIColor.whiteColor()
                }
                else if stringValue == "Dark" {
                    displaySeg.selectedSegmentIndex = 1
                    defaultLabel.textColor = UIColor.whiteColor()
                    displayLabel.textColor = UIColor.whiteColor()
                    self.view.tintColor = UIColor.yellowColor()
                    self.view.backgroundColor = UIColor.grayColor()
                }
                else {
                    displaySeg.selectedSegmentIndex = UISegmentedControlNoSegment
                }
            }
            else {
                displaySeg.selectedSegmentIndex = UISegmentedControlNoSegment
            }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        if displaySeg.selectedSegmentIndex != UISegmentedControlNoSegment {
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(displaySeg.titleForSegmentAtIndex(displaySeg.selectedSegmentIndex), forKey: "color")
            defaults.synchronize()
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
