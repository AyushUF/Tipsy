//
//  SettingsViewController.swift
//  Tipsy
//
//  Created by Ayush Gupta on 1/5/17.
//  Copyright © 2017 Ayush Gupta. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defTipControl: UISegmentedControl!
    let defaults = UserDefaults.standard

    
    override func viewDidLoad() {
        super.viewDidLoad()

        defTipControl.selectedSegmentIndex = defaults.integer(forKey: "defTip")
        defaults.set(false, forKey: "defUpdate")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func defaultUpdate(_ sender: AnyObject) {
        defaults.set(defTipControl.selectedSegmentIndex, forKey: "defTip")
        defaults.set(true, forKey: "defUpdate")
    }
    
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
