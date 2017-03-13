//
//  SettingsViewController.swift
//  Tip
//
//  Created by Trinadh on 3/11/17.
//  Copyright © 2017 Trinadh. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

   
    @IBOutlet weak var USDtoEUR: UITextField!
    @IBOutlet weak var USDtoYEN: UITextField!
    @IBOutlet weak var USDtoINR: UITextField!
    @IBOutlet weak var USDtoGBP: UITextField!
    let userDefaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        //let userDefaults = NSUserDefaults.standardUserDefaults()
        if let EURkey = userDefaults.object(forKey:"EUR"){
            print(EURkey)
             USDtoEUR.text = userDefaults.string(forKey: "EUR")
        } else {
            userDefaults.setValue(0.93, forKey: "EUR")
             USDtoEUR.text = userDefaults.string(forKey: "EUR")
        }
        
        if let YENkey = userDefaults.object(forKey:"YEN"){
            print(YENkey)
            USDtoYEN.text = userDefaults.string(forKey: "YEN")
        } else {
             userDefaults.setValue(114.75, forKey: "YEN")
            USDtoYEN.text = userDefaults.string(forKey: "YEN")
        }

        
        
        if let INRkey = userDefaults.object(forKey:"INR") {
            print(INRkey)
            USDtoINR.text = userDefaults.string(forKey: "INR")
        } else {
            userDefaults.setValue(65.6, forKey: "INR")
            USDtoINR.text = userDefaults.string(forKey: "INR")
        }

        
         if let GBPkey = userDefaults.object(forKey:"GBP") {
            print(GBPkey)
            USDtoGBP.text = userDefaults.string(forKey: "GBP")
        } else {
             userDefaults.setValue(0.82, forKey: "GBP")
            USDtoGBP.text = userDefaults.string(forKey: "GBP")
        }

        
        
        
        
        
        
        
    }
    
   
    
   
// EURO
    @IBAction func euroConversion(_ sender: AnyObject) {
        
      
        
        let eur = Double(USDtoEUR.text!) ?? 0
         let val = String(format: "%.2f", eur)
        print(val )
        userDefaults.setValue(val, forKey: "EUR")
        
        
    
    }
    
// YEN
    @IBAction func yenConversion(_ sender: AnyObject) {
        
        let yen = Double(USDtoYEN.text!) ?? 0
        let val = String(format: "%.2f", yen)
        userDefaults.setValue(val, forKey: "YEN")
        
    }
    
// INR
    @IBAction func inrConversion(_ sender: AnyObject) {
        
        let inr = Double(USDtoINR.text!) ?? 0
        let val = String(format: "%.2f", inr)
        userDefaults.setValue(val, forKey: "INR")
        
    }
 // GBP
    @IBAction func gbpConversion(_ sender: AnyObject) {
        
        let gbp = Double(USDtoGBP.text!) ?? 0
        let val = String(format: "%.2f", gbp)
        userDefaults.setValue(val, forKey: "GBP")
        
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

}
