//
//  Common.swift
//  StaticProfileApp
//
//  Created by 서보경 on 2021/09/09.
//

import UIKit

extension UserDefaults {
    static var shared: UserDefaults? {
        let shared = UserDefaults(suiteName: "group.com.sbk.staticprofileapp")
        return shared
    }
}
