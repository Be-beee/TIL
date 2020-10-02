//
//  FloatingButtonListViewController.swift
//  FloatingButton
//
//  Created by 서보경 on 2020/09/23.
//

import UIKit

class FloatingButtonListViewController: UIViewController {

    @IBOutlet weak var btn1CenterY: NSLayoutConstraint!
    @IBOutlet weak var btn2CenterY: NSLayoutConstraint!
    @IBOutlet weak var btn3CenterY: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn1CenterY.constant = 0
        btn2CenterY.constant = 0
        btn3CenterY.constant = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            // usingSpringWithDamping : 반동? 튕기는 효과 -> 0에 가까울 수록 많이 튕김
            self.btn1CenterY.constant = 70
            self.btn2CenterY.constant = 140
            self.btn3CenterY.constant = 210
            
            self.view.layoutIfNeeded() // 화면 갱신
        } completion: { (completion) in
            // 애니메이션 끝나는 지점
        }

        
    }

    @IBAction func dismissFloating(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            self.btn1CenterY.constant = 0
            self.btn2CenterY.constant = 0
            self.btn3CenterY.constant = 0
            
            self.view.layoutIfNeeded() // 화면 갱신
        } completion: { (completion) in
            // 애니메이션 끝나는 지점
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    
    @IBAction func food3Action(_ sender: UIButton) {
        
        print("food3 tapped")
    }
    
    
}
