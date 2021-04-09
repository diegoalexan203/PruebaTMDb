//
//  ResponseMovies.swift
//  PruebaDiegoOchoa
//
//  Created by Diego Ochoa on 30/03/21.
//

import Foundation
import ObjectMapper

struct ResponseMovies: Mappable {
    var page: Int?
    var movies: [MoviesEntity]?
    var totalPages, totalResults: Int?
    
    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        page <- map["page"]
        movies <- map["results"]
        totalPages <- map["total_pages"]
        totalResults <- map["total_results"]
    }
}
