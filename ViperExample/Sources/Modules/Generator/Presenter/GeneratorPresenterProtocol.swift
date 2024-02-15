//
//  GeneratorPresenterProtocol.swift
//  ViperExample
//
//  Created by ivanovdale on 15/02/2024.
//  Copyright © 2024 mobdevfactory12. All rights reserved.
//

protocol GeneratorPresenterProtocol: AnyObject {
    func configureView()
    func generateRandomViperButtonTapped()
    func learnMoreButtonTapped()

    func updateViperNumberValue()
    func updateViperImageNameValue()
}
