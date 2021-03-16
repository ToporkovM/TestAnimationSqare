//
//  ViewController.swift
//  TestAnimationSqare
//
//  Created by Максим Топорков on 16.03.2021.
//  Copyright © 2021 Максим Топорков. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private enum Constants {
        static let squareViewWithBeforeAnimation: CGFloat = 60.0
        static let squareViewHeightBeforeAnimation: CGFloat = 60.0
        static let squareViewWithAfterAnimation: CGFloat = 120.0
        static let squareViewHeightAfterAnimation: CGFloat = 120.0
    }
    
    private enum AnimationState {
        case before
        case after
    }
    
    let squareView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewBeforeAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.7) {
            self.setupViewAfterAnimation()
        }
    }
    
    private func returnSizeDependingOnCondition(condition: AnimationState) -> CGRect {
        switch condition {
        case .before:
            return CGRect(x: 0, y: 0,  width: Constants.squareViewWithBeforeAnimation, height: Constants.squareViewHeightBeforeAnimation)
        case .after:
            return CGRect(x: 0, y: 0, width: Constants.squareViewWithAfterAnimation, height: Constants.squareViewHeightAfterAnimation)
        }
    }
    
    private func setupViewBeforeAnimation() {
        squareView.frame = returnSizeDependingOnCondition(condition: AnimationState.before)
        squareView.center = view.center
        view.addSubview(squareView)
    }
    
    private func setupViewAfterAnimation() {
        squareView.frame = returnSizeDependingOnCondition(condition: AnimationState.after)
        squareView.center = view.center
    }
}

