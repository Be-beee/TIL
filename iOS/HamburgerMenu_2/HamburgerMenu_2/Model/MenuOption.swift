//
//  MenuOption.swift
//  HamburgerMenu_2
//
//  Created by 서보경 on 2020/09/08.
//  Copyright © 2020 서보경. All rights reserved.
//

import UIKit

enum MenuOption: Int, CustomStringConvertible {
    case Profile
    case Inbox
    case Notifications
    case Settings
    
    var description: String {
        switch self {
        case .Profile: return "Profile"
        case .Inbox: return "Inbox"
        case .Notifications: return "Notifications"
        case .Settings: return "Settings"
        }
    }
    
    var image: UIImage {
        switch self {
        case .Profile: return UIImage(named: "person.png") ?? UIImage()
        case .Inbox: return UIImage(named: "mail.png") ?? UIImage()
        case .Notifications: return UIImage(named: "hamburgerline.png") ?? UIImage()
        case .Settings: return UIImage(named: "setting.png") ?? UIImage()
        }
    }
}
