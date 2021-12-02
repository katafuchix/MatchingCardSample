//
//  ProfileContentView.swift
//  MatchingCardSample
//
//  Created by cano on 2021/12/02.
//

import UIKit

class ProfileCard: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
    }
    
    private func setupView() {
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.borderWidth = 0.3
        self.layer.cornerRadius = 20.0
        self.clipsToBounds = true
    }
    
    func setProfileData(_ data: Profile) {
        self.clear()
        
        self.imageView.image = UIImage(named: data.image)
        self.nameLabel.text  = data.name
        self.tweetLabel.text = data.tweet
    }
    
    func clear() {
        self.imageView.image = UIImage()
        self.nameLabel.text  = ""
        self.tweetLabel.text = ""
    }
}
