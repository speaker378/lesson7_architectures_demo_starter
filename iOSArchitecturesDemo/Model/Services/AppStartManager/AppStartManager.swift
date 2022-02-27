//
//  AppStartConfigurator.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 19.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppStartManager {
    
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let rootVCApps = SearchAppsBuilder.build()
        let navAppsVC = configuredNavigationController()
        navAppsVC.viewControllers = [rootVCApps]
        rootVCApps.navigationItem.title = "Search apps"
        navAppsVC.tabBarItem.title = rootVCApps.navigationItem.title


        let rootVCSongs = SearchSongsBuilder.build()
        let navSongsVC = configuredNavigationController()
        navSongsVC.viewControllers = [rootVCSongs]
        rootVCSongs.navigationItem.title = "Search songs"
        navSongsVC.tabBarItem.title = rootVCSongs.navigationItem.title

        let tabVC = configuredTabBarController
        tabVC.viewControllers = [navAppsVC, navSongsVC]

        window?.rootViewController = tabVC
        window?.makeKeyAndVisible()
    }

    private func configuredNavigationController() -> UINavigationController {
        let navVC = UINavigationController()
        navVC.navigationBar.barTintColor = UIColor.varna
        navVC.navigationBar.isTranslucent = false
        navVC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        return navVC
    }

    private lazy var configuredTabBarController: UITabBarController = {
        let tabVC = UITabBarController()
        tabVC.tabBar.barStyle = .default
        tabVC.tabBar.barTintColor = UIColor.varna
        tabVC.tabBar.isTranslucent = false
        return tabVC
    }()
}
