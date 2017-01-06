//
//  ViewController.swift
//  Tipsy
//
//  Created by Ayush Gupta on 1/5/17.
//  Copyright © 2017 Ayush Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billVal: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!

    @IBOutlet weak var by2Label: UILabel!
    @IBOutlet weak var by3Label: UILabel!
    @IBOutlet weak var by4Label: UILabel!
    @IBOutlet weak var by5Label: UILabel!
    
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billVal.becomeFirstResponder()
        billVal.placeholder = String(format: "%.2f", defaults.double(forKey: "lastBill"))
        
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "defTip")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if defaults.bool(forKey: "defUpdate") == true {
            tipControl.selectedSegmentIndex = defaults.integer(forKey: "defTip")
            calcTip(tipControl)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    @IBAction func calcTip(_ sender: AnyObject) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = NSLocale.current
        
        let tipVal = [ 0.15, 0.2, 0.25]
        
        let bill = Double(billVal.text!) ?? defaults.double(forKey: "lastBill")
        let tip = bill * tipVal[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        
        tipLabel.text = formatter.string(from: (NSNumber:tip) as NSNumber)!
        totalLabel.text = formatter.string(from: (NSNumber:total) as NSNumber)!
        by2Label.text = formatter.string(from: (NSNumber:total/2) as NSNumber)!
        by3Label.text = formatter.string(from: (NSNumber:total/3) as NSNumber)!
        by4Label.text = formatter.string(from: (NSNumber:total/4) as NSNumber)!
        by5Label.text = formatter.string(from: (NSNumber:total/5) as NSNumber)!

        defaults.set(bill, forKey: "lastBill")
    }

}

