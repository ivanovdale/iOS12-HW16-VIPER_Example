//
//  GeneratorConfigurator.swift
//  ViperExample
//
//  Created by ivanovdale on 15/02/2024.
//  Copyright © 2024 mobdevfactory12. All rights reserved.
//

// MARK: - Protocol

protocol GeneratorConfiguratorProtocol {
    func configure(with viewController: GeneratorViewController)
}

// MARK: - Implementation

final class GeneratorConfigurator: GeneratorConfiguratorProtocol {
    func configure(with viewController: GeneratorViewController) {
        let router = GeneratorRouter()
        router.navigationController = viewController.navigationController

        let presenter = GeneratorPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = GeneratorInteractor()
        interactor.presenter = presenter

        presenter.interactor = interactor
        viewController.presenter = presenter
    }
}
