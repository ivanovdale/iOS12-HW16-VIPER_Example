//
//  GeneratorInteractorProtocol.swift
//  ViperExample
//
//  Created by ivanovdale on 15/02/2024.
//  Copyright © 2024 mobdevfactory12. All rights reserved.
//

import Foundation

protocol GeneratorInteractorProtocol {
    var viperImageName: String { get }
    var viperNumber: Int { get }
    var maximalViperNumber: Int { get }

    func getViperImageName()
    func getViperNumber()
}
