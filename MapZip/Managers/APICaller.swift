//
//  APICaller.swift
//  MapZip
//
//  Created by choi hyunjin on 2022/03/09.
//

import Foundation
import Alamofire

struct Constants {
    let API_KEY = "f95d37bc2f3d04027de315de608e72e4"
}

enum APIError : Error {
    case failedToGetData
}

struct Response<T: Codable> : Codable {
    let page: Int
    let results: [T]
    let total_pages : Int
    let total_results: Int
}


class APICaller{
    static let shared = APICaller()
    
    func getTrendingItems(completion : @escaping (AFDataResponse<Response<Trending>>) -> Void) {
        let url = "https://api.themoviedb.org/3/trending/all/day"
        let params : Parameters = [
            "api_key" : "f95d37bc2f3d04027de315de608e72e4"
        ]
        AF.request(url, method: .get, parameters: params, encoding: URLEncoding.default)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: Response<Trending>.self, completionHandler: completion)
    }
}
