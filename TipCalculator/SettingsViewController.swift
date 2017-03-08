//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Zhou, Xuan on 3/7/17.
//  Copyright © 2017 Zhou, Xuan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipPercLabel: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

       /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        print("changed")
        let defaults = UserDefaults.standard;
        defaults.set(tipPercLabel.selectedSegmentIndex, forKey:"defaultPerc")
        defaults.synchronize()
    }


}
