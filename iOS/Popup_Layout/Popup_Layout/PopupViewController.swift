//
//  PopupViewController.swift
//  Popup_Layout
//
//  Created by 서보경 on 2020/09/29.
//

import UIKit

class PopupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func closePopup(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    // 팝업뷰를 벗어나는 위치에 버튼 등의 상호작용이 필요한 오브젝트가 있을 경우 팝업뷰 외부에 위치하도록 한다.
}
