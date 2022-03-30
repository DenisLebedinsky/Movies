//
//  MainTabBarController.swift
//  Movies
//
//  Created by Denis Lebedinsky on 27.03.2022.
//

import Foundation
import UIKit

class MainTabBarController: BubbleTabBarController {
    
    var customTabBarView = UIView(frame: .zero)
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        setupTabBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    private func setupTabBar(){
            let HomeController = createNavController(vc: HomeViewController(), itemName: "Home", ItemImage: "house.fill")
            let WatchingController = createNavController(vc: WatchingViewController(), itemName: "Watching", ItemImage: "eye.circle.fill")
            let ProfileController = createNavController(vc: ProfileViewController(), itemName: "Profile", ItemImage: "person.crop.circle.fill")
            viewControllers = [HomeController, WatchingController, ProfileController]
        }
    
    private func createNavController(vc: UIViewController, itemName: String, ItemImage: String) -> UINavigationController {
            let item = UITabBarItem(title: itemName, image: UIImage(systemName: ItemImage), tag: 0)
            let navController = UINavigationController(rootViewController: vc)
            navController.tabBarItem = item
        
            return navController
        }
}
