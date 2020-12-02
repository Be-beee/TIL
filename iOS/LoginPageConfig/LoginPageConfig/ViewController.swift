//
//  ViewController.swift
//  LoginPageConfig
//
//  Created by 서보경 on 2020/12/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if UserDefaults.standard.string(forKey: "loginData") == nil {
            guard let loginVC = UIStoryboard(name: "LoginMenuController", bundle: nil).instantiateViewController(withIdentifier: "loginVC") as? LoginMenuController else { return }
            loginVC.modalPresentationStyle = .fullScreen
            self.present(loginVC, animated: false, completion: nil)
        } else {
            
            mainLabel.text = "Hello, "+UserDefaults.standard.string(forKey: "loginData")!
        }
    }


    @IBAction func logout(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "loginData")
        guard let loginVC = UIStoryboard(name: "LoginMenuController", bundle: nil).instantiateViewController(withIdentifier: "loginVC") as? LoginMenuController else { return }
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true, completion: nil) // 로그인 메뉴 호출
    }
}

