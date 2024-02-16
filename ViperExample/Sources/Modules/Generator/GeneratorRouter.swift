//
//  GeneratorRouter.swift
//  ViperExample
//
//  Created by ivanovdale on 15/02/2024.
//  Copyright © 2024 mobdevfactory12. All rights reserved.
//

import UIKit

// MARK: - Protocol

protocol GeneratorRouterProtocol {
    func showDetailsScene(avatarName: String, viperNumber: Int)
}

// MARK: - Implementation

final class GeneratorRouter: GeneratorRouterProtocol {
    var navigationController: UINavigationController?

    func showDetailsScene(avatarName: String, viperNumber: Int) {
        guard let navigationController else { return }

        let detailsViewController = DetailsViewController()
        detailsViewController.avatarName = avatarName
        detailsViewController.viperNumber = viperNumber

        navigationController.pushViewController(detailsViewController, animated: true)
    }
}

