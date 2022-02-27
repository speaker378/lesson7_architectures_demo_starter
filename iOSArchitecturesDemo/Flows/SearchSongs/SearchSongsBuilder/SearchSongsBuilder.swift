//
//  SearchSongsBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Сергей Черных on 27.02.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class SearchSongsBuilder {

    static func build() -> (UIViewController & SearchSongsViewInput) {
        let router = SearchSongsRouter()
        let interactor = SearchSongsInteractor()
        let presenter = SearchSongsPresenter(interactor: interactor, router: router)
        let viewController = SearchSongsViewController(searchPresenter: presenter)

        presenter.viewInput = viewController
        router.viewController = viewController
        return viewController
    }

}
