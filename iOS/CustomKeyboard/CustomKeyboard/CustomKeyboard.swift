//
//  CustomKeyboard.swift
//  CustomKeyboard
//
//  Created by 서보경 on 2020/09/21.
//

import UIKit


// delegate

protocol CustomKeyboardDelegate {
    func keboardTapped(str: String)
}

class CustomKeyboard: UIView {

    var delegate: CustomKeyboardDelegate?
    
    @IBAction func btnTapped(_ sender: UIButton) {
        delegate?.keboardTapped(str: sender.titleLabel!.text!)
    }
    
    
}
