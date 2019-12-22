//
//  NetworkService.swift
//  MyAppleMusic
//
//  Created by Macbook on 21.12.2019.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import UIKit
import Alamofire

class NetworkService {
    
    func fetchTracks(searchText: String, competion: @escaping (SearchResponse?) -> Void) {
        let url = "https://itunes.apple.com/search?term=\(searchText)"
        let parameters = ["term": "\(searchText)",
            "limit": "10",
            "media":"music"]
        
        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData {
            dataResponse in
            if let error = dataResponse.error {
                print("Error received requestiong data: \(error.localizedDescription)")
                competion(nil)
                return
            }
            guard let data = dataResponse.data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let objects = try decoder.decode(SearchResponse.self, from: data)
                print("objects: ", objects)
                competion(objects)
                
            } catch let jsonError {
                print("Failed to decode JSON", jsonError)
                competion(nil)
            }
            return
        }
    }
}
