//
//  DetailsPresenter.swift
//  ViperExample
//
//  Created by ivanovdale on 15/02/2024.
//  Copyright © 2024 mobdevfactory12. All rights reserved.
//

final class DetailsPresenter: DetailsPresenterProtocol {
    weak var view: DetailsViewProtocol!
    var interactor: DetailsInteractorProtocol!
    var router: DetailsRouterProtocol!

    func okButtonPressed() {
        router.closeCurrentScene()
    }
}
