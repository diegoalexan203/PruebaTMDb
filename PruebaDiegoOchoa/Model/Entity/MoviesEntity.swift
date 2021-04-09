//
//  MoviesEntity.swift
//  PruebaDiegoOchoa
//
//  Created by Diego Ochoa on 30/03/21.
//

import Foundation
import ObjectMapper

struct MoviesEntity: Codable, Mappable {
    var adult: Bool?
    var backdropPath: String?
    var genreIDS: [Int]?
    var id: Int?
    var originalLanguage, originalTitle, overview: String?
    var popularity: Double?
    var posterPath, releaseDate, title: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?
    
    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        adult <- map["adult"]
        backdropPath <- map["backdrop_path"]
        genreIDS  <- map["genre_ids"]
        originalLanguage <- map["originalLanguage"]
        originalTitle <- map["originalTitle"]
        overview <- map["overview"]
        popularity <- map["popularity"]
        posterPath <- map["poster_path"]
        releaseDate <- map["release_date"]
        title <- map["title"]
        video <- map["video"]
        voteAverage <- map["vote_average"]
        voteCount <- map["voteCount"]
    }
}

