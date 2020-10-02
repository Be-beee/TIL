//
//  ViewController.swift
//  Popup_Layout
//
//  Created by 서보경 on 2020/09/29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showPopup(_ sender: UIButton) {
        // PopupViewController
        
        let popupVC = UIStoryboard(name: "PopupViewController", bundle: nil).instantiateViewController(withIdentifier: "popupVC") as! PopupViewController
        popupVC.modalPresentationStyle = .overCurrentContext
        
        self.present(popupVC, animated: false, completion: nil)
    }
    
}

