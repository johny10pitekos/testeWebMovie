//
//  WMTabBarViewController.swift
//  WeM0vies
//
//  Created by Pitekos on 23/04/25.
//

import UIKit

class WMTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAparenceTabBar()
        setupTab()
    }
    
    private func setupAparenceTabBar() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 0.1137, green: 0.1137, blue: 0.1686, alpha: 1.0)
        
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.lightGray
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor.white
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        tabBar.standardAppearance = appearance
    }
    
    private func setupTab() {
        let vcWHome = WMHomeViewController()
        let vcWMCar = WMCarViewController()
        let vcWMProfile = WMProfileViewController()
        
        let nav1 = UINavigationController(rootViewController: vcWMCar)
        let nav2 = UINavigationController(rootViewController: vcWHome)
        let nav3 = UINavigationController(rootViewController: vcWMProfile)
        
        vcWMCar.tabBarItem = UITabBarItem(title: "Carrinho", image: UIImage(named: "car"), tag: 1)
        vcWHome.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 2)
        vcWMProfile.tabBarItem = UITabBarItem(title: "Perfil", image: UIImage(named: "person"), tag: 3)
        setViewControllers([nav1, nav2, nav3], animated: true)
        self.selectedIndex = 1
    }
}

