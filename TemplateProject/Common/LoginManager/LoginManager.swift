//
//  LoginManager.swift
//  TemplateProject
//
//  Created by Dung Do on 11/09/2021.
//  Copyright © 2021 HD. All rights reserved.
//

import UIKit

class SocialLoginManager {
    
    static let shared = SocialLoginManager()
    private var socialLogin: SocialLogin?
    
    func login(on vc: UIViewController, socialLogin: SocialLogin, complete: @escaping (Dictionary<String, Any>?, Error?)->()) {
        self.socialLogin = socialLogin
        self.socialLogin?.login(on: vc, complete: complete)
    }
    
    func logout() {
        self.socialLogin?.logout()
    }
    
}
