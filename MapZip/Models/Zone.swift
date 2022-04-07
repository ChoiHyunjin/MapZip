//
//  Zone.swift
//  MapZip
//
//  Created by choi hyunjin on 2022/04/08.
//

import Foundation

struct Zone: Codable {
    let id: String
    let name: String
    let alias: String
    let location: Location
}
