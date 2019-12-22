//
//  SearchPresenter.swift
//  MyAppleMusic
//
//  Created by Macbook on 22.12.2019.
//  Copyright (c) 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

protocol SearchPresentationLogic {
  func presentData(response: Search.Model.Response.ResponseType)
}

class SearchPresenter: SearchPresentationLogic {
  weak var viewController: SearchDisplayLogic?
  
    func presentData(response: Search.Model.Response.ResponseType ) {
        switch response {
        case .some:
            print("presenter .some")
        case .presentTracks(let searchResults):
            
            let cells = searchResults?.results.map ({ (track) in
                cellViewModel(from: track)
            }) ?? []
            
            let searchViewModel = SearchViewModel.init(cells: cells)
            print("presnter .presentTracks")
            viewController?.displayData(viewModel: Search.Model.ViewModel.ViewModelData.displayTracks(searchViewModel: searchViewModel))
        }
    }
    
    private func cellViewModel (from track: Track) -> SearchViewModel.Cell {
        return SearchViewModel.Cell(iconUrlString: track.artworkUrl100,
                                    trackName: track.trackName,
                                    collectionName: track.collectionName ?? "",
                                    artistName: track.artistName,
                                    previewUrl: track.previewUrl)
    }
}
