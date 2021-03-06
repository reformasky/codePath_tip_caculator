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
    let defaults = UserDefaults.standard;

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadView()
       // tipPercLabel.selectedSegmentIndex = defaults.integer(forKey: "defaultPerc")
        print(tipPercLabel.selectedSegmentIndex)
        NotificationCenter.default.addObserver(self, selector:#selector(ViewController.appWillTerminate) , name: NSNotification.Name.UIApplicationWillTerminate, object: nil)
        billNumber.text = String("")
        let setTime = defaults.object(forKey: "setTime")
        print(setTime ?? "not there")
        if (setTime != nil && NSDate().compare(setTime as! Date).rawValue < 0) {
            billNumber.text = defaults.string(forKey: "bill");
        } else {
            defaults.removeObject(forKey: "setTime")
            defaults.removeObject(forKey: "bill")
        }
        calculate()
        
        view.addGestureRecognizer(tapRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        print("hello")
        //view.endEditing(true)
    }
    
    func calculate() {
        let tipPrecs = [0.15, 0.18, 0.20];
        let bill = Double(billNumber.text!) ?? 0;
        let tip = bill * tipPrecs[tipPercLabel.selectedSegmentIndex];
        let total = bill + tip;
        tipLabel.text = String(format: "$%.2f", tip);
        TotalLabel.text = String(format: "$%.2f", total);
       
        

    }
    
    @IBAction func billAmountInput(_ sender: AnyObject) {
        calculate()

    }

    @IBAction func tipPercChange(_ sender: AnyObject) {
        calculate()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        billNumber.becomeFirstResponder();
        tipPercLabel.selectedSegmentIndex = defaults.integer(forKey: "defaultPerc");
        print(tipPercLabel.selectedSegmentIndex)
        print("view will appear")
    }
    
    func appWillTerminate() {
        defaults.set(billNumber.text, forKey: "bill")
        defaults.set(NSDate().addingTimeInterval(TimeInterval(100 )), forKey:"setTime")
    }
}

