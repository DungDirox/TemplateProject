//
//  ViewController.swift
//  TemplateProject
//
//  Created by Tran Gia Huy on 9/30/17.
//  Copyright © 2017 HD. All rights reserved.
//

import UIKit
import RxSwift

class BaseVC: UIViewController {
    
    let disposeBag = DisposeBag()
    
    enum SwitchAnimation {
        case top, bottom, fade
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        locaize()
        setupRx()
    }
    
    // MARK: - private function
    func setupViews() {
        navigationController?.isNavigationBarHidden = true
        
        let tapCloseKeyboard = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(tapCloseKeyboard)
        tapCloseKeyboard.cancelsTouchesInView = false
    }
    
    func locaize() {}
    
    func setupRx() {}
    
    @objc func closeKeyboard() {
        view.endEditing(true)
    }
    
    func backToRoot(animation: SwitchAnimation = .fade) {
        switchToAnimation(animation)
        navigationController?.popToRootViewController(animated: false)
    }
    
    func show(_ vc: UIViewController, animation: SwitchAnimation) {
        switchToAnimation(animation)
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func hidden(animation: SwitchAnimation = .fade) {
        switchToAnimation(animation)
        navigationController?.popViewController(animated: false)
    }
    
    private func switchToAnimation(_ animation: SwitchAnimation) {
        let transition = CATransition()
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        switch animation {
        case .top:
            transition.type = .push
            transition.subtype = .fromTop
        case .bottom:
            transition.type = .push
            transition.subtype = .fromBottom
        case .fade:
            transition.type = .fade
        }
        
        navigationController?.view.layer.removeAnimation(forKey: "ShowAnimation")
        navigationController?.view.layer.add(transition, forKey: "ShowAnimation")
    }
}
