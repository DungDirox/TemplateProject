//
//  TestVM.swift
//  TemplateProject
//
//  Created by Dung Do on 04/10/2021.
//  Copyright © 2021 HD. All rights reserved.
//

import Foundation

class TestVM: BaseVM {
    
    deinit {
        Log.d("TestVM")
    }
    
    func test() {
        handleLoading.onNext(true)
        Utils.delay(1) { [weak self] in
            self?.handleLoading.onNext(false)
        }
    }
    
}
