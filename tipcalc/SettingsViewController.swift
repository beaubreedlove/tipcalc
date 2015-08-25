//
//  SettingsViewController.swift
//  tipcalc
//
//  Created by Beau Breedlove on 8/24/15.
//  Copyright (c) 2015 Tumblr. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
//    @IBOutlet weak var defaultTip1: UITextField!
//    @IBOutlet weak var defaultTip2: UITextField!
//    @IBOutlet weak var defaultTip3: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // var defaults = NSUserDefaults.standardUserDefaults()
        // defaultTip1.text = String(defaults.integerForKey("tip1"))
        // defaultTip2.text = String(defaults.integerForKey("tip2"))
        // defaultTip3.text = String(defaults.integerForKey("tip3"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func doneClicked(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
