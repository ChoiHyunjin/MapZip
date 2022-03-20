//
//  TV.swift
//  MapZip
//
//  Created by choi hyunjin on 2022/03/21.
//

import Foundation

struct TV : Codable{
    let id: Int
    let adult: Bool?
    let backdrop_path: String?
    let genre_ids: [Int]?
    let title: String?
    let original_language: String?
    let original_title: String?
    let poster_path: String?
    let media_type: String?
}
