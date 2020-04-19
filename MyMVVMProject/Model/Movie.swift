//
//  Movie.swift
//  MyMVVMProject
//
//  Created by André Salla on 18/04/20.
//  Copyright © 2020 André Salla. All rights reserved.
//

import Foundation

struct Movie: Codable {
    
    let title: String
    let description: String
    let director: String
    let producer: String
    let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case director = "director"
        case producer = "producer"
        case description = "description"
        case releaseDate = "release_date"
    }
}
