//
//  CounterViewController.swift
//  PreReactorKit
//
//  Created by Masakazu Sano on 2018/04/16.
//  Copyright © 2018年 Masakazu Sano. All rights reserved.
//

import UIKit
import ReactorKit
import RxCocoa
import RxSwift

class CounterViewController: UIViewController, StoryboardView {
    typealias Reactor = CounterViewReactor
    
    @IBOutlet var decreaseButton: UIButton!
    @IBOutlet var increaseButton: UIButton!
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!
    var disposeBag = DisposeBag()
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        guard let reactor = self.reactor else {
//            return
//        }
//        bind(reactor: reactor)
//    }

    
//    func bind(reactor: CounterViewReactor) {
//        // Action
//        increaseButton.rx.tap
//            .map { Reactor.Action.increase }
//            .bind(to: reactor.action)
//            .disposed(by: disposeBag)
//        decreaseButton.rx.tap
//            .map { Reactor.Action.decrease }
//            .bind(to: reactor.action)
//            .disposed(by: disposeBag)
//
//        // State
//        reactor.state.map { $0.value }
//            .distinctUntilChanged()
//            .map { "\($0)" }
//            .bind(to: valueLabel.rx.text)
//            .disposed(by: disposeBag)
//        reactor.state.map { $0.isLoading }
//            .distinctUntilChanged()
//            .bind(to: activityIndicatorView.rx.isAnimating)
//            .disposed(by: disposeBag)
//    }
    
    func bind(reactor: CounterViewController.Reactor) {
        // Action
        increaseButton.rx.tap
            .map { Reactor.Action.increase }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        decreaseButton.rx.tap
            .map { Reactor.Action.decrease }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)

        // State
        reactor.state.map { $0.value }
            .distinctUntilChanged()
            .map { "\($0)" }
            .bind(to: valueLabel.rx.text)
            .disposed(by: disposeBag)
        reactor.state.map { $0.isLoading }
            .distinctUntilChanged()
            .bind(to: activityIndicatorView.rx.isAnimating)
            .disposed(by: disposeBag)
    }
}
