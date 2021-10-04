//
//  BaseViewModel.swift
//  TemplateProject
//
//  Created by Dung Do on 03/10/2021.
//  Copyright © 2021 HD. All rights reserved.
//

import Foundation
import RxSwift

class BaseVM {
    
    var handleLoading = PublishSubject<Bool>()
    var handleError = PublishSubject<String>()
    
}
