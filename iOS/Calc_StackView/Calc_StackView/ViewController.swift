//
//  ViewController.swift
//  Calc_StackView
//
//  Created by 서보경 on 2020/09/20.
//

import UIKit

// iOS Autolayout 가이드
// 계산기 뷰

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btn10: UIButton!
    @IBOutlet weak var btn11: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.layer.cornerRadius = 20
//        resultLabel.layer.masksToBounds = true
        resultLabel.clipsToBounds = true
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        btn1.layer.cornerRadius = btn1.bounds.width / 2
        btn2.layer.cornerRadius = btn2.bounds.width / 2
        btn3.layer.cornerRadius = btn3.bounds.width / 2
        btn4.layer.cornerRadius = btn4.bounds.width / 2
        btn5.layer.cornerRadius = btn5.bounds.width / 2
        btn6.layer.cornerRadius = btn6.bounds.width / 2
        btn7.layer.cornerRadius = btn7.bounds.width / 2
        btn8.layer.cornerRadius = btn8.bounds.width / 2
        btn9.layer.cornerRadius = btn9.bounds.width / 2
        btn10.layer.cornerRadius = btn10.bounds.height / 2
        btn11.layer.cornerRadius = btn11.bounds.width / 2
    }
    
    
    @IBAction func btnAction(_ sender: Any) {
        resultLabel.text = "press 1"
        print("Pressed Button 1")
    }
    
}

