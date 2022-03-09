//
//  SearchSongsInteractor.swift
//  iOSArchitecturesDemo
//
//  Created by Сергей Черных on 27.02.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import Alamofire

protocol SearchSongsInteractorInput {
    func requestSongs(with query: String, completion: @escaping (Result<[ITunesSong]>) -> Void)
}

final class SearchSongsInteractor: SearchSongsInteractorInput {
    private let searchService = ITunesSearchService()

    func requestSongs(with query: String, completion: @escaping (Result<[ITunesSong]>) -> Void) {
        self.searchService.getSongs(forQuery: query, completion: completion)
    }
}
