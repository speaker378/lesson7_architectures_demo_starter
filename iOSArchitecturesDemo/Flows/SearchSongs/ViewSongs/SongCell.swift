//
//  SongCell.swift
//  iOSArchitecturesDemo
//
//  Created by Сергей Черных on 27.02.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

final class SongCell: UITableViewCell {

    // MARK: - Subviews

    private(set) lazy var imgView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10.0
        imageView.layer.masksToBounds = true
        return imageView
    }()

    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()

    private(set) lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 13.0)
        return label
    }()

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }

    // MARK: - Methods

    func configure(with cellModel: SongCellModel) {
        self.imgView.image = UIImage(systemName: "music.note")
        self.titleLabel.text = cellModel.title
        self.subtitleLabel.text = cellModel.subtitle
    }

    // MARK: - UI

    override func prepareForReuse() {
        [self.titleLabel, self.subtitleLabel].forEach { $0.text = nil }
    }

    private func configureUI() {
        self.addImgView()
        self.addTitleLabel()
        self.addSubtitleLabel()
    }

    private func addImgView() {
        self.contentView.addSubview(self.imgView)
        NSLayoutConstraint.activate([
            self.imgView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            self.imgView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.imgView.widthAnchor.constraint(equalToConstant: 20.0),
            self.imgView.heightAnchor.constraint(equalToConstant: 20.0),
        ])
    }

    private func addTitleLabel() {
        self.contentView.addSubview(self.titleLabel)
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            self.titleLabel.leftAnchor.constraint(equalTo: self.imgView.rightAnchor, constant: 12.0),
            self.titleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
        ])
    }

    private func addSubtitleLabel() {
        self.contentView.addSubview(self.subtitleLabel)
        NSLayoutConstraint.activate([
            self.subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 4.0),
            self.subtitleLabel.leftAnchor.constraint(equalTo: self.imgView.rightAnchor, constant: 12.0),
            self.subtitleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
        ])
    }
}
