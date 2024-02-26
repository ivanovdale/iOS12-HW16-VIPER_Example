//
//  DetailsConfigurator.swift
//  ViperExample
//
//  Created by ivanovdale on 15/02/2024.
//  Copyright © 2024 mobdevfactory12. All rights reserved.
//

import UIKit

protocol DetailsModuleBuilderProtocol {
    static func build(navigationController: UINavigationController) -> DetailsViewController
}

final class DetailsModuleBuilder: DetailsModuleBuilderProtocol {
    static func build(navigationController: UINavigationController) -> DetailsViewController {
        let viewController = DetailsViewController()

        let router = DetailsRouter()
        router.navigationController = navigationController

        let presenter = DetailsPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = DetailsInteractor()
        interactor.presenter = presenter

        presenter.interactor = interactor
        viewController.presenter = presenter

        return viewController
    }
}
