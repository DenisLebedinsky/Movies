//
//  MainTabBarController.swift
//  Movies
//
//  Created by Denis Lebedinsky on 27.03.2022.
//

import Foundation
import UIKit

class MainTabBarController: BubbleTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc1.tabBarItem.title = "home"
        
        let vc2 = UINavigationController(rootViewController: WatchingViewController())
        vc2.tabBarItem.image = UIImage(systemName: "eye")
        vc2.tabBarItem.title = "wathcing"
        
        let vc3 = UINavigationController(rootViewController: ProfileViewController())
        vc3.tabBarItem.image = UIImage(systemName: "person")
        vc3.tabBarItem.title = "profile"

        
        setViewControllers([vc1, vc2, vc3], animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }


}
