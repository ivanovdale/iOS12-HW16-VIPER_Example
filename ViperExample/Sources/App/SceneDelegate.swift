//
//  SceneDelegate.swift
//  ViperExample
//
//  Created by Daniil (work) on 15.02.2024.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let navigationController = UINavigationController()

        let detailsViewController = DetailsModuleBuilder.build(navigationController: navigationController)
        let generatorViewController = GeneratorModuleBuilder.build(
            navigationController: navigationController,
            detailsViewController: detailsViewController
        )
        navigationController.viewControllers = [generatorViewController]

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

