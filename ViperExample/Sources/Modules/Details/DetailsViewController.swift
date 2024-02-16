//
//  DetailsViewController.swift
//  ViperExample
//
//  Created by ivanovdale on 15/02/2024.
//  Copyright © 2024 mobdevfactory12. All rights reserved.
//

import UIKit
import SnapKit

protocol DetailsViewProtocol: AnyObject { }

final class DetailsViewController: UIViewController, DetailsViewProtocol {

    var presenter: DetailsPresenterProtocol!
    let configurator: DetailsModuleBuilderProtocol = DetailsModuleBuilder()

    var avatarName: String? {
        didSet {
            guard let avatarName else { return }
            viperAvatar.image = UIImage(named: avatarName)
        }
    }

    var viperNumber: Int? {
        didSet {
            guard let viperNumber else { return }
            titleLabel.text = "\(Constants.titleText) \(viperNumber)"
        }
    }

    // MARK: - Outlets

    private lazy var viperAvatar: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = Constants.avatarBorderWidth
        imageView.layer.borderColor = Constants.avatarBorderColor.cgColor
        imageView.clipsToBounds = true

        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center

        return label
    }()

    private lazy var okButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.okText, for: .normal)
        button.setTitleColor(Constants.buttonButtonTitleColor, for: .normal)
        button.backgroundColor = Constants.buttonBackgroundColor
        button.layer.cornerRadius = Constants.buttonHeight / 2

        button.addTarget(self, action: #selector(okButtonPressed), for: .touchUpInside)

        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.build(with: self)
        setupHierarchy()
        setupLayout()
        setupView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateViperAvatarCornerRadius()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        [
            viperAvatar,
            titleLabel,
            okButton,
        ].forEach { view.addSubview($0) }
    }

    private func setupLayout() {
        viperAvatar.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view).offset(Constants.avatarTopOffset)
            make.height.equalTo(view).multipliedBy(Constants.avatarHeightFactor)
            make.width.equalTo(viperAvatar.snp.height)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(viperAvatar.snp.bottom).offset(Constants.titleTopOffset)
            make.leading.trailing.equalTo(view)
        }

        okButton.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(Constants.buttonOffset)
            make.trailing.equalTo(view).offset(-Constants.buttonOffset)
            make.bottom.equalTo(view).offset(-Constants.buttonOffsetBottom)
            make.height.equalTo(Constants.buttonHeight)
        }
    }

    private func setupView() {
        view.backgroundColor = Constants.backgroundColor
        navigationItem.hidesBackButton = true
    }

    private func updateViperAvatarCornerRadius() {
        viperAvatar.layer.cornerRadius = viperAvatar.frame.size.height / 2.0
    }

    // MARK: - Actions

    @objc private func okButtonPressed() {
        presenter.okButtonPressed()
    }
}

// MARK: - Constants

fileprivate enum Constants {

    // MARK: Strings

    static let titleText = "Beautiful viper №"
    static let okText = "OK"

    // MARK: Layout

    static let avatarHeightFactor = 0.4
    static let avatarTopOffset = 90
    static let avatarBorderWidth = CGFloat(1)
    static let avatarBorderColor = UIColor.systemGray3
    static let titleTopOffset = 16
    static let buttonOffset = 22
    static let buttonOffsetBottom = 12
    static let buttonHeight = CGFloat(44)

    // MARK: Style

    static let backgroundColor = UIColor.systemBackground
    static let titleTextColor = UIColor.label
    static let titleFont = UIFont.systemFont(ofSize: 20, weight: .bold)
    static let buttonBackgroundColor = UIColor.systemGreen
    static let buttonButtonTitleColor = UIColor.systemBackground
}
