//
//  AppleLogin.swift
//  ReachAt
//
//  Created by Dung Do on 9/27/20.
//  Copyright © 2020 ReachAt. All rights reserved.
//

import UIKit
import AuthenticationServices

@available(iOS 13.0, *)
class AppleLogin: NSObject, SocialLogin, ASAuthorizationControllerDelegate {
    
    var complete: ((Dictionary<String, Any>?, Error?)->())?
    
    func login(on viewController: UIViewController, complete: @escaping (Dictionary<String, Any>?, Error?)->()) {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
        
        self.complete = complete
    }
    
    func logout() {
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential,
           let appleIDToken = appleIDCredential.identityToken,
           let idTokenString = String(data: appleIDToken, encoding: .utf8) {
            
            var data: Dictionary<String, Any> = [:]
            data["userId"] = appleIDCredential.user
            data["name"] = appleIDCredential.fullName?.givenName
            data["email"] = appleIDCredential.email
            data["accessToken"] = idTokenString
            
            complete?(data, nil)
        } else {
            complete?(nil, nil)
        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        complete?(nil, error)
    }
    
}
