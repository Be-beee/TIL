//
//  Profile.swift
//  StaticProfileApp
//
//  Created by 서보경 on 2021/09/08.
//

import UIKit

struct Profile {
    var name: String
    var profileImg: String
    var job: String
    var email: String
    var github: String
    
    init() {
        self.name = UserDefaults.shared?.object(forKey: "name") as? String ?? ""
        self.job = UserDefaults.shared?.object(forKey: "job") as? String ?? ""
        self.email = UserDefaults.shared?.object(forKey: "email") as? String ?? ""
        self.github = UserDefaults.shared?.object(forKey: "github") as? String ?? ""
        self.profileImg = UserDefaults.shared?.object(forKey: "img") as? String ?? ""
    }
}



struct ImageManager {
    static func urlToImage(from url: String) -> UIImage? {
        if let url = URL(string: url) {
            if let imgData = try? Data(contentsOf: url) {
                return UIImage(data: imgData)
            }
        }
        return UIImage(systemName: "heart")
    }
}
