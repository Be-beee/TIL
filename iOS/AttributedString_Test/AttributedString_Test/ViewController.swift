//
//  ViewController.swift
//  AttributedString_Test
//
//  Created by 서보경 on 2020/09/14.
//  Copyright © 2020 서보경. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var testLabel: UILabel!
    var sampleText = """
                <p class = "test">
                    안녕하세요! 안녕하세요! 안녕하세요! 안녕하세요! 안녕하세요! 안녕하세요! 안녕하세요! 안녕하세요! 안녕하세요! 안녕하세요! 안녕하세요! 안녕하세요! 안녕하세요! 안녕하세요! 안녕하세요! 안녕하세요! 안녕하세요! 안녕하세요! 안녕하세요! 안녕하세요! 안녕하세요! 안녕하세요! 안녕하세요! 안녕하세요! 안녕하세요! 안녕하세요!
                </p>
    """
    override func viewDidLoad() {
        super.viewDidLoad()
        testLabel.text = sampleText
        testLabel.attributedText = sampleText.loadHTML()
    }
}

extension String {
    func loadHTML() -> NSAttributedString? {
        let style = """
                    <style>
                    p.test {
                        font-family: AppleSDGothicNeo-Bold;
                        font-size: 17px;
                        color: #bf8dff;
                    }
                    </style>
        """
        let addedStyle = "\(style) \(self)"
        guard let data = addedStyle.data(using: .unicode) else {
            print("guarded")
            return nil
        }
        do {
            let attributed = try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
            return attributed
        } catch {
            print("error => \(error)")
            return nil
        }
        
    }
}
