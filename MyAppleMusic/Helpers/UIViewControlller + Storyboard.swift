//
//  UIViewControlller + Storyboard.swift
//  MyAppleMusic
//
//  Created by Macbook on 22.12.2019.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

extension UIViewController {
    
    class func loadFromStoryBoard<T: UIViewController>() -> T {
        let name = String(describing: T.self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        if let viewController = storyboard.instantiateInitialViewController() as? T {
            return viewController
        } else {
            fatalError("Error: no initial view controleer in \(name) storyboard!")
        }
    }
}

