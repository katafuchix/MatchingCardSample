//
//  ViewController.swift
//  MatchingCardSample
//
//  Created by cano on 2021/12/02.
//

import UIKit
import Koloda
import PinLayout
import RxSwift
import RxCocoa
import NSObject_Rx

class ViewController: UIViewController {

    @IBOutlet weak var cardBaseView: UIView!
    @IBOutlet weak var reloadhButton: UIBarButtonItem!
    
    fileprivate let swipeCardView = R.nib.swipeCardView.firstView(owner: nil)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setupViews()
        self.bind()
    }

    private func setupViews() {
        self.cardBaseView.addSubview(self.swipeCardView)
        self.swipeCardView.pin.all()
    }
    
    private func bind() {
        self.reloadhButton.rx.tap.asDriver().drive(onNext: { [unowned self] _ in
            self.swipeCardView.reload()
        }).disposed(by: rx.disposeBag)
    }
}

