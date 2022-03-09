//
//  WhatIsNewView.swift
//  iOSArchitecturesDemo
//
//  Created by Сергей Черных on 26.02.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit


class WhatIsNewView: UIView {

    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0

        return label
    }()

    private(set) lazy var versionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()

    private(set) lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()

    private(set) lazy var currentVersionReleaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .right
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUI() {
        self.addSubview(titleLabel)
        self.addSubview(versionLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(currentVersionReleaseDateLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),

            versionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            versionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            versionLabel.rightAnchor.constraint(equalTo: centerXAnchor),

            currentVersionReleaseDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            currentVersionReleaseDateLabel.leftAnchor.constraint(equalTo: centerXAnchor),
            currentVersionReleaseDateLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),

            descriptionLabel.topAnchor.constraint(equalTo: versionLabel.bottomAnchor, constant: 10),
            descriptionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            descriptionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),

            descriptionLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

        ])
    }
}
