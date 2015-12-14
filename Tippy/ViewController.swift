//
//  ViewController.swift
//  Tippy
//
//  Created by Michaela Foote on 12/10/15.
//  Copyright © 2015 Michaela Foote. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipControl: UISegmentedControl!

    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var billStatic: UILabel!
    @IBOutlet weak var totalStatic: UILabel!
    @IBOutlet weak var tipStatic: UILabel!
    
    @IBOutlet weak var splitLabel: UILabel!
    
    
    @IBOutlet weak var split2Label: UILabel!
    @IBOutlet weak var split3Label: UILabel!
    @IBOutlet weak var split4Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        updateIt()
    }
    
    func updateIt() {
        let tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        split2Label.text = "$\(total/2)"
        split3Label.text = "$\(total/3)"
        split4Label.text = "$\(total/4)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        split2Label.text = String(format: "$%.2f", total/2)
        split3Label.text = String(format: "$%.2f", total/3)
        split4Label.text = String(format: "$%.2f", total/4)
    }

     override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let defTip = defaults.integerForKey("default")
        switch defTip {
        case 0...2:
            tipControl.selectedSegmentIndex = defTip
        default:
            tipControl.selectedSegmentIndex = 0
        }
            let stringValue = defaults.stringForKey("color")
            if (stringValue != nil) {
                if stringValue == "Light" {
                    splitLabel.textColor = UIColor.blackColor()
                    tipStatic.textColor = UIColor.blackColor()
                    totalStatic.textColor = UIColor.blackColor()
                    billStatic.textColor = UIColor.blackColor()
                    tipLabel.textColor = UIColor.blackColor()
                    totalLabel.textColor = UIColor.blackColor()
                    self.view.tintColor = UIColor.purpleColor()
                    self.view.backgroundColor = UIColor.whiteColor()
                }
                else if stringValue == "Dark" {
                    splitLabel.textColor = UIColor.whiteColor()
                    tipStatic.textColor = UIColor.whiteColor()
                    totalStatic.textColor = UIColor.whiteColor()
                    billStatic.textColor = UIColor.whiteColor()
                    tipLabel.textColor = UIColor.whiteColor()
                    totalLabel.textColor = UIColor.whiteColor()
                    self.view.tintColor = UIColor.yellowColor()
                    self.view.backgroundColor = UIColor.grayColor()
                }
            }
        updateIt()
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
 
}

