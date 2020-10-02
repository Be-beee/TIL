//
//  SettingController.swift
//  HamburgerMenu_2
//
//  Created by 서보경 on 2020/09/08.
//  Copyright © 2020 서보경. All rights reserved.
//

import UIKit

class SettingController: UIViewController {
    
    // MARK: - Properties
    
    var username: String?
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        if let username = username {
            print("username is \(username)")
        } else {
            print("username not found ...")
        }
    }
    
    // MARK: - HSelectors
    
    @objc func handleDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Handlers
    
    func configureUI() {
        view.backgroundColor = .white
        
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Settings"
        navigationController?.navigationBar.barStyle = .default
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "setting.png")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismiss))
        
    }
}
