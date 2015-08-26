//
//  ViewController.swift
//  tipcalc
//
//  Created by Beau Breedlove on 8/24/15.
//  Copyright (c) 2015 Tumblr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var splitControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var perPersonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tipDefaults = ["tip1": 18, "tip2": 20, "tip3": 22]
        
        NSUserDefaults.standardUserDefaults().registerDefaults(tipDefaults)
        
        NSUserDefaults.standardUserDefaults().synchronize()
        
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let tip1 = defaults.integerForKey("tip1")
        let tip2 = defaults.integerForKey("tip2")
        let tip3 = defaults.integerForKey("tip3")
        
        tipControl.setTitle("\(tip1)%", forSegmentAtIndex: 0)
        tipControl.setTitle("\(tip2)%", forSegmentAtIndex: 1)
        tipControl.setTitle("\(tip3)%", forSegmentAtIndex: 2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onEditingChanged(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        var tip1 = Double(defaults.integerForKey("tip1")) * 0.01
        var tip2 = Double(defaults.integerForKey("tip2")) * 0.01
        var tip3 = Double(defaults.integerForKey("tip3")) * 0.01
        
        var tipPercentages = [tip1, tip2, tip3]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        var splitOptions = [1.0, 2.0, 3.0, 4.0]
        
        var split = splitOptions[splitControl.selectedSegmentIndex]
        
        if (split == 1) {
            perPersonLabel.text = ""
        } else {
            var totalPerPerson = total / split
            
            perPersonLabel.text = String(format: "$%.2f each", totalPerPerson)
        }
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
}

