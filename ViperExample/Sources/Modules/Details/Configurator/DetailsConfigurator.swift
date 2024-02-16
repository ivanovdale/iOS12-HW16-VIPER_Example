//
//  DetailsConfigurator.swift
//  ViperExample
//
//  Created by ivanovdale on 15/02/2024.
//  Copyright © 2024 mobdevfactory12. All rights reserved.
//

import UIKit

protocol DetailsConfiguratorProtocol {
    func configure(with viewController: DetailsViewController)
}

final class DetailsConfigurator: DetailsConfiguratorProtocol {
    func configure(with viewController: DetailsViewController) {
        let router = DetailsRouter()
        router.navigationController = viewController.navigationController

        let presenter = DetailsPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = DetailsInteractor()
        interactor.presenter = presenter

        presenter.interactor = interactor
        viewController.presenter = presenter
    }
}
