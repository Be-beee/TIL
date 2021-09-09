//
//  ViewController.swift
//  StaticProfileApp
//
//  Created by 서보경 on 2021/09/08.
//

import UIKit

class ViewController: UIViewController {

    var myProfile = Profile(name: "Be-beee", profileImg: "profile", job: "iOS Developer", email: "maybutter756@gmail.com", github: "https://github.com/be-beee")
    
    @IBOutlet weak var profileCardView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var githubLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCardView()
        setProfileCardContent()
    }
    
    func setCardView() {
        profileCardView.layer.cornerRadius = 10
        profileCardView.layer.masksToBounds = false
        profileCardView.layer.shadowOffset = CGSize(width: 5, height: 5)
        profileCardView.layer.shadowOpacity = 0.5
    }
    
    func setProfileCardContent() {
        profileImage.image = UIImage(named: myProfile.profileImg)
        nameLabel.text = myProfile.name
        jobLabel.text = myProfile.job
        emailLabel.text = myProfile.email
        githubLabel.text = myProfile.github
    }


}

