//
//  SwipeCardView.swift
//  MatchingCardSample
//
//  Created by cano on 2021/12/02.
//

import UIKit
import Koloda
import RxSwift
import RxCocoa
import NSObject_Rx

class SwipeCardView: UIView {

    @IBOutlet fileprivate weak var kolodaView: KolodaView!
    @IBOutlet fileprivate weak var skipButton: UIButton!
    @IBOutlet fileprivate weak var okButton: UIButton!
    
    var profiles:[Profile] = SwipeCardView.getProfileData()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
        self.bind()
    }
    
    static func getProfileData() -> [Profile] {
        var data: Data
        let file = R.file.profilesJson()!
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load file")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Profile].self, from: data)
        } catch {
            fatalError("Couldn't parse file")
        }
    }
    
    private func setupView() {
        self.backgroundColor = .clear
        self.okButton.clipsToBounds = true
        self.okButton.layer.cornerRadius = 8
        self.skipButton.clipsToBounds = true
        self.skipButton.layer.cornerRadius = 8
        
        self.kolodaView.dataSource = self
        self.kolodaView.delegate = self
    }
    
    private func bind() {
        self.skipButton.rx.tap.asDriver().drive(onNext:{ [unowned self] _ in
            self.kolodaView.swipe(.left)
        }).disposed(by: rx.disposeBag)
        
        self.okButton.rx.tap.asDriver().drive(onNext:{ [unowned self] _ in
            self.kolodaView.swipe(.right)
        }).disposed(by: rx.disposeBag)
    }
    
    func reload() {
        self.kolodaView.resetCurrentCardIndex()
        self.kolodaView.reloadData()
        
        self.skipButton.isHidden = false
        self.okButton.isHidden   = false
    }
}


extension SwipeCardView: KolodaViewDataSource {

    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return profiles.count
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        guard let card = R.nib.profileCard.firstView(owner: nil) else { return UIView() }
        card.setProfileData(self.profiles[index])
        card.frame = self.kolodaView.frame
        return card
    }
}

extension SwipeCardView: KolodaViewDelegate {
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
 
        if direction == .right {
            
        } else if direction == .left {
            
        }
    }
    
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        self.skipButton.isHidden = true
        self.okButton.isHidden   = true
    }
}
