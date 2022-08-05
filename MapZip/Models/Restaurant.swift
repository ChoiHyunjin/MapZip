//
//  Restaurant.swift
//  MapZip
//
//  Created by choi hyunjin on 2022/08/06.
//

import Foundation

struct Restaurant : Codable{
    let id: Int
    let address: String
    let categories: [String]?
    let latitude: Double
    let longitude: Double
    let name: String
    let rating: Double
    let youtubers: [Youtuber]?
}
