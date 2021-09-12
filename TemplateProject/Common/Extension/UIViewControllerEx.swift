//
//  UIViewControllerEx.swift
//  TemplateProject
//
//  Created by Dung Do on 12/09/2021.
//  Copyright © 2021 HD. All rights reserved.
//

import UIKit

protocol InterfaceInitable: AnyObject {
    static var classId: String { get }
    static func initFromNib() -> Self
    static func initFromStoryboard() -> Self
}

extension InterfaceInitable where Self: UIViewController {
    static var classId: String {
        return String(describing: Self.self)
    }

    static func initFromNib() -> Self {
        return Self(nibName: classId, bundle: nil)
    }

    static func initFromStoryboard() -> Self {
        let storyboard = UIStoryboard.init(name: classId, bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: classId) as? Self else {
            fatalError("classId không khớp storyboard identifier.")
        }
        return vc
    }
}

extension UIViewController: InterfaceInitable {}
