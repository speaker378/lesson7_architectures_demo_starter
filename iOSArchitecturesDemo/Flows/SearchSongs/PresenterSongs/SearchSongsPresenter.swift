//
//  SearchSongsPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Сергей Черных on 27.02.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

protocol SearchSongsViewInput: AnyObject {
    var searchResults: [ITunesSong] { get set }

    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
    func throbber(show: Bool)
}

protocol SearchSongsViewOutput: AnyObject {
    func viewDidSearch(with query: String)
    func viewDidSelectSong(song: ITunesSong)
}

class SearchSongsPresenter {

    weak var viewInput: (UIViewController & SearchSongsViewInput)?

    let interactor: SearchSongsInteractorInput
    let router: SearchSongsRouterInput

    init(interactor: SearchSongsInteractorInput, router: SearchSongsRouterInput) {
        self.interactor = interactor
        self.router = router
    }

    private func requestSongs(with query: String) {
        self.interactor.requestSongs(with: query) { [weak self]  (result) in
            guard let self = self else { return }

            self.viewInput?.throbber(show: false)
            result
                .withValue { songs in
                    guard !songs.isEmpty else {
                        self.viewInput?.searchResults = []
                        self.viewInput?.showNoResults()
                        return
                    }
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchResults = songs
                }
                .withError {
                    self.viewInput?.showError(error: $0)
                }
        }
    }
}

extension SearchSongsPresenter: SearchSongsViewOutput {
    func viewDidSearch(with query: String) {
        viewInput?.throbber(show: true)
        requestSongs(with: query)
    }

    func viewDidSelectSong(song: ITunesSong) {
        self.router.openDetails(for: song)
    }
}
