//
//  MainTabBarController.swift
//  Movies
//
//  Created by Denis Lebedinsky on 27.03.2022.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    var customTabBarView = UIView(frame: .zero)
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTabBarUI()
        self.addCustomTabBarView()
        setupTabBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.setupCustomTabBarFrame()
    }
    
    
    // MARK: Private methods
    
    private func setupCustomTabBarFrame() {
        let height = self.view.safeAreaInsets.bottom + 20
    
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = height
        tabFrame.size.width -= 20
        tabFrame.origin.y = self.view.frame.size.height - height - 40
        tabFrame.origin.x = 10
        
        self.tabBar.frame = tabFrame
        self.tabBar.setNeedsLayout()
        self.tabBar.layoutIfNeeded()
        customTabBarView.frame = tabBar.frame
    }
    
    private func setupTabBarUI(){
        
        self.tabBar.backgroundColor = UIColor.systemPink
        self.tabBar.layer.cornerRadius = 20
        self.tabBar.tintColor = .white
        
        // Remove the line
        if #available(iOS 13.0, *) {
            let appearance = self.tabBar.standardAppearance
            appearance.shadowImage = nil
            appearance.shadowColor = nil
            
            self.tabBar.standardAppearance = appearance
        } else {
            self.tabBar.shadowImage = UIImage()
            self.tabBar.backgroundImage = UIImage()
            
        }
    }
    
    private func addCustomTabBarView() {
        self.customTabBarView.frame = tabBar.frame
        
//        self.customTabBarView.backgroundColor = .yellow
        self.customTabBarView.layer.cornerRadius = 30
        self.customTabBarView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        self.customTabBarView.layer.masksToBounds = false
        self.customTabBarView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        self.customTabBarView.layer.shadowOffset = CGSize(width: -4, height: -6)
        self.customTabBarView.layer.shadowOpacity = 0.5
        self.customTabBarView.layer.shadowRadius = 20
        
        self.view.addSubview(customTabBarView)
        self.view.bringSubviewToFront(self.tabBar)
    }
    
    
    private func setupTabBar(){
            let HomeController = createNavController(vc: HomeViewController(), itemName: "Home", ItemImage: "calendar.badge.clock")
            let WatchingController = createNavController(vc: WatchingViewController(), itemName: "Watching", ItemImage: "calendar.badge.clock")
            let ProfileController = createNavController(vc: ProfileViewController(), itemName: "Profile", ItemImage: "calendar.badge.clock")
            viewControllers = [HomeController, WatchingController, ProfileController]
        }
    
    private func createNavController(vc: UIViewController, itemName: String, ItemImage: String) -> UINavigationController {
            let item = UITabBarItem(title: itemName, image: UIImage(systemName: ItemImage), tag: 0)
            
    
//            item.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
        
        
            let navController = UINavigationController(rootViewController: vc)
            navController.tabBarItem = item
        
    
    
            return navController
        }
}
