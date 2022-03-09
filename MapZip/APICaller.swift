//
//  APICaller.swift
//  MapZip
//
//  Created by choi hyunjin on 2022/03/09.
//

import Foundation

struct Constants {
    let API_KEY = "f95d37bc2f3d04027de315de608e72e4"
}

class APICaller{
    static let API_caller = APICaller()
    
    func getTrendingItems() {
        let url = "https://api.themoviedb.org/3/trending/all/day?api_key=f95d37bc2f3d04027de315de608e72e4"
        
    }
}
