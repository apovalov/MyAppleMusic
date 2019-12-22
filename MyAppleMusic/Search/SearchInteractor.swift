//
//  SearchInteractor.swift
//  MyAppleMusic
//
//  Created by Macbook on 22.12.2019.
//  Copyright (c) 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit

protocol SearchBusinessLogic {
    func makeRequest(request: Search.Model.Request.RequestType)
}

class SearchInteractor: SearchBusinessLogic {
    
    var networkService = NetworkService()
    var presenter: SearchPresentationLogic?
    var service: SearchService?
    
    func makeRequest(request: Search.Model.Request.RequestType) {
        if service == nil {
            service = SearchService()
        }
        
        switch request {
        case .some:
            print("interactor .some")
            presenter?.presentData(response: Search.Model.Response.ResponseType.some)
        case .getTracks(let searchItem):
            print("interactor .getTracks")
            networkService.fetchTracks(searchText: searchItem) { [weak self] (searchResponse) in
                self?.presenter?.presentData(response: Search.Model.Response.ResponseType.presentTracks(searchResponse: searchResponse))
            }
        }
    }
}
