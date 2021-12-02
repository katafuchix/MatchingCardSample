//
//  Profile.swift
//  MatchingCardSample
//
//  Created by cano on 2021/12/02.
//

import Foundation

struct Profile: Codable {
    var id: Int
    var name: String
    var age: Int
    var prefecture: String
    var tweet: String
    var image: String
}
