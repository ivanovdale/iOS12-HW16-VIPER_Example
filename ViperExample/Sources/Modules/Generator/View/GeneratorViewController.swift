//
//  GeneratorViewController.swift
//  ViperExample
//
//  Created by ivanovdale on 15/02/2024.
//  Copyright © 2024 mobdevfactory12. All rights reserved.
//

import UIKit

final class GeneratorViewController: UIViewController, GeneratorViewInput {

    var output: GeneratorViewOutput!

    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: GeneratorViewInput

    func setupInitialState() {
    }
}
