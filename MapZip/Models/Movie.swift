//
//  Movie.swift
//  MapZip
//
//  Created by choi hyunjin on 2022/03/10.
//

import Foundation

struct Trending : Codable {
    let id: Int
    let vote_average: Double?
    let overview: String?
    let release_date: String?
    let adult: Bool?
    let backdrop_path: String?
    let vote_count: Int?
    let genre_ids: [Int]?
    let title: String?
    let original_language: String?
    let original_title: String?
    let poster_path: String?
    let video: Bool?
    let popularity: Double?
    let media_type: String?
}

