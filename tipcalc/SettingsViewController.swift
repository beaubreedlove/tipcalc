//
//  SettingsViewController.swift
//  tipcalc
//
//  Created by Beau Breedlove on 8/24/15.
//  Copyright (c) 2015 Tumblr. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tip1Field: UITextField!
    @IBOutlet weak var tip2Field: UITextField!
    @IBOutlet weak var tip3Field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var defaults = NSUserDefaults.standardUserDefaults()
        tip1Field.text = String(defaults.integerForKey("tip1"))
        tip2Field.text = String(defaults.integerForKey("tip2"))
        tip3Field.text = String(defaults.integerForKey("tip3"))
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

    @IBAction func backClicked(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    @IBAction func saveClicked(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tip1Field.text.toInt()!, forKey: "tip1")
        defaults.setInteger(tip2Field.text.toInt()!, forKey: "tip2")
        defaults.setInteger(tip3Field.text.toInt()!, forKey: "tip3")
        defaults.synchronize()
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}
