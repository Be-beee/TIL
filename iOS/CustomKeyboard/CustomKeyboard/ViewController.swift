//
//  ViewController.swift
//  CustomKeyboard
//
//  Created by 서보경 on 2020/09/21.
//

import UIKit

class ViewController: UIViewController, CustomKeyboardDelegate {
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        firstTextField.inputView = "커스텀 키보드 뷰"
        
        let myKeyboard = Bundle.main.loadNibNamed("CustomKeyboard", owner: nil, options: nil)
        
        let mykeyboardView = myKeyboard?.first as! CustomKeyboard
        mykeyboardView.delegate = self
        
        firstTextField.inputView = mykeyboardView
    }

    
    func keboardTapped(str: String) {
        
        let oldTmp = firstTextField.text!.components(separatedBy: ",").joined()
        let oldNumber = Int(oldTmp)
        var newNumber = Int(str)
        
        if str == "00", oldNumber != nil {
            newNumber = oldNumber! * 100
        }
        
        if str == "000", oldNumber != nil {
            newNumber = oldNumber! * 1000
        }
        
        if let hasNumber = newNumber {
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            if let formatted = numberFormatter.string(from: NSNumber(value: hasNumber)) {
                self.firstTextField.text = String(describing: formatted)
            }
            
            
        }
        
//        switch str {
//        case "00", "000":
//            self.firstTextField.text! += str
//        default:
//            self.firstTextField.text = str
//        }
    }

}

