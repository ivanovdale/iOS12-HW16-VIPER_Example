//
//  DetailsRouter.swift
//  ViperExample
//
//  Created by ivanovdale on 15/02/2024.
//  Copyright © 2024 mobdevfactory12. All rights reserved.
//

import UIKit

final class DetailsRouter: DetailsRouterProtocol {
    var navigationController: UINavigationController?

    func closeCurrentScene() {
        guard let navigationController else { return }

        navigationController.popViewController(animated: true)
    }

}
