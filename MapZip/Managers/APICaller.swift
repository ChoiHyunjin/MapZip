//
//  APICaller.swift
//  MapZip
//
//  Created by choi hyunjin on 2022/03/09.
//

import Foundation
import Alamofire

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
            "api_key" : Constants.API_KEY
        ]
        AF.request(url, method: .get, parameters: params, encoding: URLEncoding.default)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: Response<Trending>.self, completionHandler: completion)
    }
    
    func getTrendingMovies(completion : @escaping (AFDataResponse<Response<Trending>>) -> Void) {
        let url = "https://api.themoviedb.org/3/trending/movie/day"
        let params : Parameters = [
            "api_key" : Constants.API_KEY
        ]
        AF.request(url, method: .get, parameters: params, encoding: URLEncoding.default)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: Response<Trending>.self, completionHandler: completion)
    }
    
    func getTrendingTV(completion : @escaping (AFDataResponse<Response<TV>>) -> Void) {
        let url = "https://api.themoviedb.org/3/trending/tv/day"
        let params: Parameters = [
            "api_key": Constants.API_KEY
        ]
        AF.request(url, method: .get, parameters: params, encoding: URLEncoding.default)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: Response<TV>.self, completionHandler: completion)
    }
}
