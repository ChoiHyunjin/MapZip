//
//  Extensions.swift
//  MapZip
//
//  Created by choi hyunjin on 2022/03/20.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.dropFirst().lowercased()
    }
}
