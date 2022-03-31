//
//  HomeViewController.swift
//  Movies
//
//  Created by Denis Lebedinsky on 27.03.2022.
//

import UIKit

class HomeViewController: UITableViewController {

    let logoView:UIView = LogoView()
    
    
    let rightBarItem: UIBarButtonItem = {
        let barItem = UIBarButtonItem()
        barItem.tintColor = .white
        barItem.image = UIImage(systemName: "magnifyingglass")
        return barItem
    }()
    
    let leftBarItem: UIBarButtonItem = {
        let barItem = UIBarButtonItem()
        barItem.customView = LogoView()
        return barItem
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.darkGray
        
        navigationItem.leftBarButtonItem = leftBarItem
        navigationItem.rightBarButtonItem = rightBarItem
      
    }
}
