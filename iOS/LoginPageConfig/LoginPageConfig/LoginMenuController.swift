//
//  LoginMenuController.swift
//  LoginPageConfig
//
//  Created by 서보경 on 2020/12/02.
//

import UIKit

class LoginMenuController: UIViewController {

    @IBOutlet weak var loginCodeField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginToMain(_ sender: UIButton) {
        
        if let code = loginCodeField.text, code == "Be-beee" {
            UserDefaults.standard.set(code, forKey: "loginData")
            self.dismiss(animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "알림", message: "코드가 입력되지 않았거나 올바르지 않습니다.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
            
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
