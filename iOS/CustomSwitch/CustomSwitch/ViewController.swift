//
//  ViewController.swift
//  CustomSwitch
//
//  Created by 서보경 on 2020/09/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var switchBG: UIView!
    @IBOutlet weak var switchBtn: UIButton!
    
    @IBOutlet weak var btnCenterX: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switchBtn.layer.cornerRadius = 50 / 2
        switchBG.layer.cornerRadius = 50 / 2
        
    }

    @IBAction func selectedBtn(_ sender: UIButton) {
        if btnCenterX.constant == 75 {
            btnCenterX.constant = -75
            switchBG.backgroundColor = .darkGray
        } else {
            btnCenterX.constant = 75
            switchBG.backgroundColor = .green
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        
    }
    
}

