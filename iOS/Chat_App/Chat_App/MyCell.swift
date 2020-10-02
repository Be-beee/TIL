//
//  MyCell.swift
//  Chat_App
//
//  Created by 서보경 on 2020/10/01.
//

import UIKit

class MyCell: UITableViewCell {

    @IBOutlet weak var myTextView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
