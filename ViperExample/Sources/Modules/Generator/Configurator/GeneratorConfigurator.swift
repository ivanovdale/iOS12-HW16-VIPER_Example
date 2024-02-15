//
//  GeneratorConfigurator.swift
//  ViperExample
//
//  Created by ivanovdale on 15/02/2024.
//  Copyright © 2024 mobdevfactory12. All rights reserved.
//

import UIKit

final class GeneratorModuleConfigurator {
    func configure(viewController: GeneratorViewController) {

        let router = GeneratorRouter()

        let presenter = GeneratorPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = GeneratorInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }
}
