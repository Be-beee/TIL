//
//  ViewController.swift
//  EmailTest
//
//  Created by 서보경 on 2020/12/09.
//

import UIKit
import MessageUI

class ViewController: UIViewController ,MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sendEmail(_ sender: UIButton) {
        let mailComposeVC = configureMailComposer()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeVC, animated: true, completion: nil)
        } else {
            print("이메일을 보낼 수 없습니다.")
        }
    }

    func configureMailComposer() -> MFMailComposeViewController {
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        mailComposeVC.setToRecipients(["maybutter756@gmail.com"])
        mailComposeVC.setSubject("문의 메일")
        mailComposeVC.setMessageBody("문의합니다~", isHTML: false)
        
        return mailComposeVC
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        // 메일 보내기에 성공 또는 실패한 후 처리
        controller.dismiss(animated: true, completion: nil)
    }

}

