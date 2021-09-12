//
//  GoogleLogin.swift
//  IDareU
//
//  Created by Dung Do on 6/20/19.
//  Copyright © 2019 Dung Do. All rights reserved.
//

import GoogleSignIn

class GoogleLogin: SocialLogin {
    
    private let loginManager = GIDSignIn.sharedInstance
    
    private let signInConfig = GIDConfiguration.init(clientID: "601387200679-mbe30uea2pir2d8f8htk30hhkuqvbk4v.apps.googleusercontent.com")
    
    func login(on vc: UIViewController, complete: @escaping (Dictionary<String, Any>?, Error?)->()) {
        self.loginManager.restorePreviousSignIn { user, error in
            if let user = user {
                complete(self.fetchMe(user: user), nil)
            } else {
                self.loginManager.signIn(with: self.signInConfig, presenting: vc) { user, error in
                    if let user = user {
                        complete(self.fetchMe(user: user), nil)
                    } else {
                        complete(nil, error)
                    }
                }
            }
        }
    }
    
    private func fetchMe(user: GIDGoogleUser) -> Dictionary<String, Any> {
        var data: Dictionary<String, Any> = [:]
        data["userId"] = user.userID
        data["name"] = user.profile?.name
        data["email"] = user.profile?.email
        data["accessToken"] = user.authentication.accessToken
        
        return data
    }
    
    func logout() {
        self.loginManager.signOut()
    }
    
}
