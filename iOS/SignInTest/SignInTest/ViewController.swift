//
//  ViewController.swift
//  SignInTest
//
//  Created by 서보경 on 2020/09/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var passwordError: UILabel!
    
    var emailErrorHeight: NSLayoutConstraint!
    var passwordErrorHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // textfield 같이 변경되는 것을 캐치하는 것이 없음
        emailTextField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
        
        emailErrorHeight = emailError.heightAnchor.constraint(equalToConstant: 0)
        passwordErrorHeight = passwordError.heightAnchor.constraint(equalToConstant: 0)
        
    }
    
    @objc func textFieldEdited(_ sender: UITextField) {
        if sender == emailTextField {
            
            if isValidEmail(email: sender.text) {
                
                emailErrorHeight.isActive = true
            } else {
                // 에러 표시
                emailErrorHeight.isActive = false
            }
        } else if sender == passwordTextField {
            if isValidPassword(pw: sender.text) {
                passwordErrorHeight.isActive = true
            } else {
                passwordErrorHeight.isActive = false
            }
        }
        
        UIView.animate(withDuration: 0.1) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    // 정규식 - regular expression
    
    func isValidEmail(email: String?) -> Bool {
        guard email != nil else { return false }
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let pred = NSPredicate(format: "SELF MATCHES %@", regEx)
        return pred.evaluate(with: email)
    }
    
    func isValidPassword(pw: String?) -> Bool {
        if let hasPw = pw {
            return hasPw.count >= 8
        }
        return false
    }


}

