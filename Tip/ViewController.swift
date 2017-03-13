//
//  ViewController.swift
//  Tip
//
//  Created by Trinadh on 3/6/17.
//  Copyright © 2017 Trinadh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
   
  
    @IBOutlet weak var currencyControl: UISegmentedControl!
    
    @IBOutlet weak var convertedCurrency: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onTap(_ sender: AnyObject) {
       // print("Hello")
        view.endEditing(true)
    }
    // Tip calculation Logic
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let tipPercentages = [0.18,0.2,0.25,0]
        
        
        let bill = Double(billField.text!) ?? 0
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        
       // tipLabel.text = "$\(tip)"
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text=String(format: "$%.2f", total)
    }
    
    // Currency conversion
    @IBAction func currencyConverter(_ sender: AnyObject) {
    
        let userDefaults = UserDefaults.standard
        
        let eur : Double
        let yen : Double
        let inr : Double
        let gbp : Double

        if  (userDefaults.object(forKey:"EUR") == nil ){
            
             eur = Double (UserDefaults.standard.string(forKey: "EUR")!) ?? 0
        } else {
          
            userDefaults.setValue( 0.93,  forKey:"EUR")
            //userDefaults.set(Value: 0.93, forKey: "EUR")
             eur = Double (UserDefaults.standard.string(forKey: "EUR")!) ?? 0        }
        
        if (userDefaults.object(forKey:"YEN") == nil){
           
             yen = Double (UserDefaults.standard.string(forKey: "YEN")!) ?? 0
        } else {
            userDefaults.setValue(114.75, forKey: "YEN")
             yen = Double (UserDefaults.standard.string(forKey: "YEN")!) ?? 0
        }
        
        
        
        if ( userDefaults.object(forKey:"INR") == nil) {
            
             inr = Double (UserDefaults.standard.string(forKey: "INR")!) ?? 0
        } else {
            userDefaults.setValue(65.6, forKey: "INR")
             inr = Double (UserDefaults.standard.string(forKey: "INR")!) ?? 0
        }
        
        
        if (userDefaults.object(forKey:"GBP") == nil) {
            
             gbp = Double (UserDefaults.standard.string(forKey: "GBP")!) ?? 0
        } else {
            userDefaults.setValue(0.82, forKey: "GBP")
             gbp = Double (UserDefaults.standard.string(forKey: "GBP")!) ?? 0
        }
        

        
        
        
        
        
        
        
        let currencyRate = [eur,yen,inr,gbp]
        
        let total_usd = Double(totalLabel.text!) ?? 0
        
        
        let total = total_usd * currencyRate[currencyControl.selectedSegmentIndex]
        
        convertedCurrency.text = String(format: "%.2f",total)
        
    
    }
   

}

