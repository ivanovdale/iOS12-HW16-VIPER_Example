//
//  DetailsInteractor.swift
//  ViperExample
//
//  Created by ivanovdale on 15/02/2024.
//  Copyright © 2024 mobdevfactory12. All rights reserved.
//

protocol DetailsInteractorProtocol { }

final class DetailsInteractor: DetailsInteractorProtocol {
    weak var presenter: DetailsPresenterProtocol!
}
