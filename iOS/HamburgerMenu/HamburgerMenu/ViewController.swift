//
//  ViewController.swift
//  HamburgerMenu
//
//  Created by 서보경 on 2020/09/07.
//  Copyright © 2020 서보경. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var leading: NSLayoutConstraint!
    @IBOutlet var trailing: NSLayoutConstraint!
    
    var menuOut = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func menuTapped(_ sender: Any) {
        if !menuOut {
            leading.constant = 150
            trailing.constant = -150
        } else {
            leading.constant = 0
            trailing.constant = 0
        }
        menuOut.toggle()
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
}

