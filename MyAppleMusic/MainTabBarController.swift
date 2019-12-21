//
//  MainTabBarController.swift
//  MyAppleMusic
//
//  Created by Macbook on 21.12.2019.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tabBar.tintColor = #colorLiteral(red: 1, green: 0, blue: 0.3764705882, alpha: 1)
        
        let searchVC = SearchViewController()
        let libraryVC = ViewController()
        
        viewControllers = [
            generateViewController(rootViewController: searchVC, image: #imageLiteral(resourceName: "search"), title: "Search"),
            generateViewController(rootViewController: libraryVC, image: #imageLiteral(resourceName: "Library"), title: "Library")
        ]
    }
    
    private func generateViewController(rootViewController: UIViewController, image: UIImage, title: String) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.image = image
        navigationVC.tabBarItem.title = title
        rootViewController.navigationItem.title = title
        
        navigationVC.navigationBar.prefersLargeTitles = true
        
        return navigationVC
    }
}

