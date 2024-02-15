//
//  DetailsViewController.swift
//  ViperExample
//
//  Created by ivanovdale on 15/02/2024.
//  Copyright © 2024 mobdevfactory12. All rights reserved.
//

import UIKit

final class DetailsViewController: UIViewController, DetailsViewInput {

    var output: DetailsViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: DetailsViewInput
    func setupInitialState() {
    }
}
