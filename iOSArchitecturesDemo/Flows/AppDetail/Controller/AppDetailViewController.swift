//
//  AppDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 20.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppDetailViewController: UIViewController {
    
    public var app: ITunesApp
    private lazy var headerViewController = AppDetailHeaderViewController(app: app)
    private lazy var whatIsNewViewController = WhatIsNewViewController(app: app)
    
    private let imageDownloader = ImageDownloader()
    
    private var appDetailView: AppDetailView {
        return self.view as! AppDetailView
    }
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    // MARK: - Private
    
    private func configureUI() {
        view.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.navigationItem.largeTitleDisplayMode = .never
        
        addHeaderViewController()
        addWhatIsNewViewController()
    }
    
    private func addHeaderViewController() {
        self.addChild(headerViewController)
        self.view.addSubview(headerViewController.view)
        
        headerViewController.didMove(toParent: self)
        headerViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerViewController.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            headerViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            headerViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
        
    }
    
    private func addWhatIsNewViewController() {
        self.addChild(whatIsNewViewController)
        self.view.addSubview(whatIsNewViewController.view)
        
        whatIsNewViewController.didMove(toParent: self)
        whatIsNewViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            whatIsNewViewController.view.topAnchor.constraint(equalTo: headerViewController.view.bottomAnchor),
            whatIsNewViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            whatIsNewViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }
}
