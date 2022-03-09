//
//  WhatIsNewViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Сергей Черных on 26.02.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class WhatIsNewViewController: UIViewController {
    private let app: ITunesApp
    private var whatIsNewView: WhatIsNewView {
        return self.view as! WhatIsNewView
    }

    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = WhatIsNewView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
    }

    private func fillData() {
        whatIsNewView.titleLabel.text = "Что нового:"
        whatIsNewView.versionLabel.text = "Версия \(app.version)"
        whatIsNewView.currentVersionReleaseDateLabel.text = String(app.currentVersionReleaseDate.prefix(10))
        whatIsNewView.descriptionLabel.text = app.releaseNotes
    }
}
