//
//  SearchSongRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Сергей Черных on 27.02.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

protocol SearchSongsRouterInput {
    func openDetails(for app: ITunesSong)
}

final class SearchSongsRouter: SearchSongsRouterInput {

    weak var viewController: UIViewController?

    func openDetails(for song: ITunesSong) {
    }

}
