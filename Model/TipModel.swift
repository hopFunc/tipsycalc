//
//  TipModel.swift
//  Tipsycalc
//
//  Created by Robert Oppedal on 24/07/2018.
//  Copyright © 2018 Robert Oppedal. All rights reserved.
//

import Foundation

class tipModel {
    private var _billAmount: Double = 0
    private var _tipPercent: Double = 0
    private var _tipAmount: Double = 0
    private var _totalAmount: Double = 0
    
    var billAmount: Double {
        get {
            return _billAmount
        } set {
            _billAmount = newValue
        }
    }
    var tipPercent: Double {
        get {
            return _tipPercent
        } set {
        _tipPercent = newValue
        }
    }
    var tipAmount: Double {
            return _tipAmount
    }
    var totalAmount: Double {
            return _totalAmount
    }
    init(billAmount: Double, tipPercent: Double) {
        self.billAmount = billAmount
        self.tipPercent = tipPercent
    }
    func calculateTip() {
        _tipAmount = billAmount * tipPercent
        _totalAmount = billAmount + tipAmount
    }
    private var _splitWithAmount: Double = 0
    private var _splitYouPay: Double = 0
    
    var splitWithAmount: Double {
        get {
            return _splitWithAmount
        } set {
            _splitWithAmount = newValue
        }
    }
    var splitYouPay: Double {
        return _splitYouPay
    }
    init(splitWithAmount: Double) {
        self.splitWithAmount = splitWithAmount
    }
    func calculateSplitToPay() {
        _splitYouPay = totalAmount / splitWithAmount
    }
}

