//
//  GeneratorPresenter.swift
//  ViperExample
//
//  Created by ivanovdale on 15/02/2024.
//  Copyright © 2024 mobdevfactory12. All rights reserved.
//

// MARK: - Protocol

protocol GeneratorPresenterProtocol: AnyObject {
    func configureView()
    func generateRandomViperButtonTapped()
    func learnMoreButtonTapped()

    func updateViperNumberValue()
    func updateViperImageNameValue()
}

// MARK: - Implementation

final class GeneratorPresenter: GeneratorPresenterProtocol {
    weak var view: GeneratorViewProtocol!
    var interactor: GeneratorInteractorProtocol!
    var router: GeneratorRouterProtocol!

    private var viperNumber: Int {
        interactor.viperNumber
    }

    private var viperImageName: String {
        interactor.viperImageName
    }

    private var maximalViperNumber: Int {
        interactor.maximalViperNumber
    }

    private var viperDescription: String {
        "\(Constants.thisIsText) \(viperNumber) \(Constants.ofText) \(maximalViperNumber) \(Constants.vipersInTheWorldText)"
    }

    func configureView() {
        generateRandomViper()
    }

    func generateRandomViperButtonTapped() {
        generateRandomViper()
    }

    func learnMoreButtonTapped() {
        router.showDetailsScene(avatarName: viperImageName, viperNumber: viperNumber)
    }

    func updateViperNumberValue() {
        view.setSubtitleText(text: viperDescription)
    }

    func updateViperImageNameValue() {
        view.setViperImage(imageName: viperImageName)
    }

    private func generateRandomViper() {
        interactor.getViperNumber()
        interactor.getViperImageName()
    }
}

// MARK: - Constants

fileprivate enum Constants {
    static let thisIsText = "This is"
    static let ofText = "of"
    static let vipersInTheWorldText = "vipers in the world."
}
