//
//  TestVC.swift
//  TemplateProject
//
//  Created by Dung Do on 04/10/2021.
//  Copyright © 2021 HD. All rights reserved.
//

import UIKit
import RxCocoa

class TestVC: BaseVC {
    
    @IBOutlet weak var btnTest: UIButton!
    
    let testVM = TestVM()
    
    deinit {
        Log.d("TestVC")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        testVM.test()
    }
    
    override func setupViews() {
        super.setupViews()
        
        self.btnTest.setTitleColor(.red, for: .normal)
    }
    
    override func locaize() {
        super.locaize()
        
        self.btnTest.setTitle("Test here", for: .normal)
    }
    
    override func setupRx() {
        super.setupRx()
        
        testVM.handleLoading.subscribe(onNext: { isShow in
            isShow ? HUDHelper.showLoading() : HUDHelper.hideLoading()
        }).disposed(by: disposeBag)
        
        testVM.handleError.subscribe(onNext: { error in
            AlertHelper.showPopup(on: self, title: error, mainButton: "OK", mainComplete: nil)
        }).disposed(by: disposeBag)
        
        btnTest.rx.tap.subscribe(onNext: { _ in
            Log.d("Tap on button Test")
        }).disposed(by: disposeBag)
    }

}
