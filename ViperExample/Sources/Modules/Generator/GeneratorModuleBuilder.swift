//
//  GeneratorConfigurator.swift
//  ViperExample
//
//  Created by ivanovdale on 15/02/2024.
//  Copyright © 2024 mobdevfactory12. All rights reserved.
//

import UIKit

// MARK: - Protocol

protocol GeneratorModuleBuilderProtocol {
    static func build(
        navigationController: UINavigationController,
        detailsViewController: DetailsViewController
    ) -> GeneratorViewController
}

// MARK: - Implementation

final class GeneratorModuleBuilder: GeneratorModuleBuilderProtocol {
    static func build(
        navigationController: UINavigationController,
        detailsViewController: DetailsViewController
    ) -> GeneratorViewController {
        let viewController = GeneratorViewController()

        let router = GeneratorRouter()
        router.navigationController = navigationController
        router.detailsViewController = detailsViewController

        let presenter = GeneratorPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = GeneratorInteractor()
        interactor.presenter = presenter

        presenter.interactor = interactor
        viewController.presenter = presenter

        return viewController
    }
}
