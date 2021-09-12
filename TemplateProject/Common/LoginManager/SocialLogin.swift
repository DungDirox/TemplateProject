//
//  SocialLogin.swift
//  TemplateProject
//
//  Created by Dung Do on 11/09/2021.
//  Copyright © 2021 HD. All rights reserved.
//

import UIKit

protocol SocialLogin {
    func login(on vc: UIViewController, complete: @escaping (Dictionary<String, Any>?, Error?)->())
    func logout()
}
