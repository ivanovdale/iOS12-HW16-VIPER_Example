//
//  GeneratorViewController.swift
//  ViperExample
//
//  Created by ivanovdale on 15/02/2024.
//  Copyright © 2024 mobdevfactory12. All rights reserved.
//

import UIKit
import SnapKit

final class GeneratorViewController: UIViewController {

    var presenter: GeneratorPresenterProtocol!
    let configurator: GeneratorConfiguratorProtocol = GeneratorConfigurator()

    // MARK: - Outlets

    private lazy var viperImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true

        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.titleText

        label.font = Constants.titleFont
        label.textAlignment = .center
        label.textColor = Constants.textColor

        return label
    }()

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.subtitleFont
        label.textAlignment = .center
        label.textColor = Constants.textColor

        return label
    }()

    private lazy var generateRandomViperButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.generateNewText, for: .normal)
        button.setTitleColor(Constants.generateButtonTitleColor, for: .normal)
        button.layer.cornerRadius = Constants.buttonHeight / 2
        button.backgroundColor = Constants.generateButtonBackgroundColor

        button.addTarget(self, action: #selector(generateRandomViperButtonTapped), for: .touchUpInside)

        return button
    }()

    private lazy var learnMoreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.learnMoreText, for: .normal)
        button.setTitleColor(Constants.learnMoreButtonTitleColor, for: .normal)
        button.layer.cornerRadius = Constants.buttonHeight / 2
        button.backgroundColor = Constants.learnMoreButtonBackgroundColor

        button.addTarget(self, action: #selector(learnMoreButtonTapped), for: .touchUpInside)

        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)

        setupHierarchy()
        setupLayout()
        setupView()

        setupInitialState()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        [
            viperImage,
            titleLabel,
            subtitleLabel,
            generateRandomViperButton,
            learnMoreButton,
        ].forEach { view.addSubview($0) }
    }

    private func setupLayout() {
        viperImage.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(view)
            make.height.equalTo(view).multipliedBy(Constants.imageHeightFactor)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.top.equalTo(viperImage.snp.bottom).offset(Constants.titleTopOffset)
        }

        subtitleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.top.equalTo(titleLabel.snp.bottom).offset(Constants.subTitleTopOffset)
        }

        generateRandomViperButton.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(Constants.buttonOffset)
            make.trailing.equalTo(view).offset(-Constants.buttonOffset)
            make.bottom.equalTo(learnMoreButton.snp.top).offset(-Constants.buttonOffsetBottom)
            make.height.equalTo(Constants.buttonHeight)
        }

        learnMoreButton.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(Constants.buttonOffset)
            make.trailing.equalTo(view).offset(-Constants.buttonOffset)
            make.bottom.equalTo(view).offset(-Constants.buttonOffset)
            make.height.equalTo(Constants.buttonHeight)
        }

    }

    private func setupView() {
        view.backgroundColor = Constants.backroundColor
    }

    // MARK: - Actions

    @objc private func generateRandomViperButtonTapped() {
        presenter.generateRandomViperButtonTapped()
    }

    @objc private func learnMoreButtonTapped() {
        presenter.learnMoreButtonTapped()
    }
}

// MARK: - GeneratorViewProtocol

extension GeneratorViewController: GeneratorViewProtocol {
    func setupInitialState() {
        presenter.configureView()
    }

    func setSubtitleText(text: String) {
        subtitleLabel.text = text
    }

    func setViperImage(imageName: String) {
        viperImage.image = UIImage(named: imageName)
    }
}

// MARK: - Constants

fileprivate enum Constants {

    // MARK: Strings

    static let titleText = "You found a viper!"
    static let generateNewText = "Generate new"
    static let learnMoreText = "Learn more"

    // MARK: Layout

    static let imageHeightFactor = 0.35
    static let titleTopOffset = 30
    static let subTitleTopOffset = 10
    static let buttonOffset = 22
    static let buttonOffsetBottom = 12
    static let buttonHeight = CGFloat(44)

    // MARK: Style

    static let backroundColor = UIColor.systemBackground
    static let titleFont = UIFont.systemFont(ofSize: 34, weight: .bold)
    static let subtitleFont = UIFont.systemFont(ofSize: 16)
    static let textColor = UIColor.label
    static let generateButtonBackgroundColor = UIColor.systemGreen
    static let generateButtonTitleColor = UIColor.systemBackground
    static let learnMoreButtonBackgroundColor = UIColor.systemGray
    static let learnMoreButtonTitleColor = UIColor.label

}
