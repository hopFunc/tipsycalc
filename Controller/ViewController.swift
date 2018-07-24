//
//  ViewController.swift
//  Tipsycalc
//
//  Created by Robert Oppedal on 24/07/2018.
//  Copyright © 2018 Robert Oppedal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tipPercentageLbl: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var tipLbl: UILabel!
    @IBOutlet weak var totalLbl: UILabel!
    
    
    
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var splitSliderLabel: UILabel!
    @IBOutlet weak var youPayLabel: UILabel!
    
    var split = tipModel(splitWithAmount: 0.0)
    
    var tip = tipModel(billAmount: 0.0, tipPercent: 0.0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTipCalculationValues()
        setSplitCalculationValues()
        updateUI()
        // Do any additional setup after loading the view, typically from a nib.
    }
//    splitting slider function
    func setSplitCalculationValues() {
        tip.splitWithAmount = Double(splitSlider.value)
        tip.calculateSplitToPay()
    }
    
    
   func setTipCalculationValues() {
    tip.tipPercent = Double(tipPercentageSlider.value)
    tip.billAmount = ((textField.text)! as NSString).doubleValue
    tip.calculateTip()
    }
    func updateUI() {
        tipLbl.text = String(format: "nok %0.2f", tip.tipAmount)
        totalLbl.text = String(format: "nok %0.2f", tip.totalAmount)
        tipPercentageLbl.text = "Tip: \(Int(tipPercentageSlider.value * 100))%"
        splitSliderLabel.text = "\(Int(splitSlider.value))-Way Split"
        youPayLabel.text = String(format: "nok %0.2f", tip.splitYouPay)
        
    }
    @IBAction func billAmountDidChange(_ sender: Any) {
        setTipCalculationValues()
        setSplitCalculationValues()
        updateUI()
    }
    
    @IBAction func tipValueDidChange(_ sender: UISlider) {
        let steps: Float = 100
        let roundedValue = round(sender.value * steps) / steps
        sender.value = roundedValue
        setTipCalculationValues()
        setSplitCalculationValues()
        updateUI()
    }
    
    @IBAction func splitSliderDidChange(_ sender: UISlider) {
     sender.setValue(Float(lroundf(splitSlider.value)), animated: true)
        setTipCalculationValues()
        setSplitCalculationValues()
        updateUI()
    }
    
}
