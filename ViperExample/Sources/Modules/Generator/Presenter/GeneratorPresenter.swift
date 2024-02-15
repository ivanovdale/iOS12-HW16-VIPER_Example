//
//  GeneratorPresenter.swift
//  ViperExample
//
//  Created by ivanovdale on 15/02/2024.
//  Copyright © 2024 mobdevfactory12. All rights reserved.
//

final class GeneratorPresenter: GeneratorModuleInput, GeneratorViewOutput, GeneratorInteractorOutput {

    weak var view: GeneratorViewInput!
    var interactor: GeneratorInteractorInput!
    var router: GeneratorRouterInput!

    func viewIsReady() {

    }
}
