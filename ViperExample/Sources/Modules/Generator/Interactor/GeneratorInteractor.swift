//
//  GeneratorInteractor.swift
//  ViperExample
//
//  Created by ivanovdale on 15/02/2024.
//  Copyright © 2024 mobdevfactory12. All rights reserved.
//

final class GeneratorInteractor: GeneratorInteractorProtocol {
    var viperImageName = ""
    var viperNumber: Int
    var maximalViperNumber: Int

    weak var presenter: GeneratorPresenterProtocol!

    init() {
        self.viperNumber = Constants.minimalViperNumber
        self.maximalViperNumber = Constants.maximumViperNumber
        self.viperImageName = getImageName(viperNumber: Constants.minimalViperNumber)
    }

    func getViperImageName() {
        viperImageName = getImageName(viperNumber: viperNumber)
        presenter.updateViperImageNameValue()
    }

    func getViperNumber() {
        viperNumber = generateRandomViperNumber()
        presenter.updateViperNumberValue()
    }

    private func getImageName(viperNumber: Int) -> String {
        "\(Constants.imagePrefix)\(viperNumber)"
    }

    /// Generates number without repeating previuos value.
    private func generateRandomViperNumber() -> Int {
        let numberGenerator = { Int.random(in: Constants.minimalViperNumber...self.maximalViperNumber) }
        var newViperNumber = numberGenerator()
        while newViperNumber == viperNumber {
            newViperNumber = numberGenerator()
        }

        return newViperNumber
    }
}

fileprivate enum Constants {
    static let minimalViperNumber = 1
    static let maximumViperNumber = 3

    static var defaultImageName: String {
        "\(imagePrefix)\(minimalViperNumber)"
    }

    static let imagePrefix = "viper"
}
