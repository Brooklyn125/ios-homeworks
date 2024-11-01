//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Brooklyn on 10/10/2024.
//
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        
        let profileVC = ProfileViewController()
        let profileNavigationController = UINavigationController(rootViewController: profileVC)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 1)
        
        let tabBarController = UITabBarController()

        let feedNavController = UINavigationController(rootViewController: FeedViewController())
        
        let profileNavController = UINavigationController(rootViewController: ProfileViewController())

        feedNavController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "person.and.background.striped.horizontal"), tag: 0)
        profileNavController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 1)

        tabBarController.viewControllers = [feedNavController, profileNavController]

        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}
