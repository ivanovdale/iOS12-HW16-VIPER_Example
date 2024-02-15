//
//  DetailsPresenter.swift
//  ViperExample
//
//  Created by ivanovdale on 15/02/2024.
//  Copyright © 2024 mobdevfactory12. All rights reserved.
//

final class DetailsPresenter: DetailsModuleInput, DetailsViewOutput, DetailsInteractorOutput {

    weak var view: DetailsViewInput!
    var interactor: DetailsInteractorInput!
    var router: DetailsRouterInput!

    func viewIsReady() {

    }
}
