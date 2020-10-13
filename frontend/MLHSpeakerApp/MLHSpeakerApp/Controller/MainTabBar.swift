//
//  MainTabBar.swift
//  MLHSpeakerApp
//
//  Created by Mondale on 10/13/20.
//  Copyright © 2020 Mondale. All rights reserved.
//

import UIKit

class MainTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func createTabBar() -> UITabBarController {
        let tabbar = UITabBarController()
        tabbar.viewControllers = [ createHomeNC(), createProfileNC()]
        return tabbar
    }
    
    func createHomeNC() -> UINavigationController {
        let homeVC = HomeVC()
        homeVC.tabBarItem.title = "Events"
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: .add, tag: 0)

        return UINavigationController(rootViewController: homeVC)
    }
    
    func createProfileNC() -> UINavigationController {
        let newBoxVC = ProfileVC()
        newBoxVC.title = "Profile"
        newBoxVC.tabBarItem = UITabBarItem(title: "Profile", image: .actions, tag: 1)

        return UINavigationController(rootViewController: newBoxVC)

    }
    
    
}
