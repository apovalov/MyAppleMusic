//
//  UserDefaults + Extension.swift
//  MyAppleMusic
//
//  Created by Macbook on 25.12.2019.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import Foundation


extension UserDefaults {
    
    static let favouriteTrackKey = "favoriteTrackKey"
    
    func savedTracks() -> [SearchViewModel.Cell] {
        let defaults = UserDefaults.standard
        
        guard let savedTracks = defaults.object(forKey: UserDefaults.favouriteTrackKey) as? Data else { return [] }
        guard let decodedTracks = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedTracks) as? [SearchViewModel.Cell] else { return [] }
        return decodedTracks
    }
}
