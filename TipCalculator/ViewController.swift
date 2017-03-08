//
//  ViewController.swift
//  TipCalculator
//
//  Created by Zhou, Xuan on 3/5/17.
//  Copyright © 2017 Zhou, Xuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipPercLabel: UISegmentedControl!
    @IBOutlet weak var billNumber: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var TotalLabel: UILabel!
    @IBOutlet var tapRecognizer: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadView()

        // Do any additional setup after loading the view, typically from a nib.
        
        view.addGestureRecognizer(tapRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        print("hello")
        view.endEditing(true)
    }
    

    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPrecs = [0.15, 0.18, 0.20];
        let bill = Double(billNumber.text!) ?? 0;
        let tip = bill * tipPrecs[tipPercLabel.selectedSegmentIndex];
        let total = bill + tip;
        tipLabel.text = String(format: "$%.2f", tip);
        TotalLabel.text = String(format: "$%.2f", total);
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard;
        tipPercLabel.selectedSegmentIndex = defaults.integer(forKey: "defaultPerc");
        print(tipPercLabel.selectedSegmentIndex)
        print("view will appear")
    }
}

