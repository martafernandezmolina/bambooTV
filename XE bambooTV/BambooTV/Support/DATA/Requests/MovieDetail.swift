//
//  MovieDetails.swift
//  BambooTV
//
//  Created by Marangi  on 04/12/2020.
//

import Foundation

struct MovieDetail: Codable {
  let adult: Bool
  let backdropPath: String?
//  let belongsToCollection: String?
  let budget: Int
  let genres: [Genre]
  let homepage: String?
  let id: Int
  let imdbID:String?
  let originalLanguage, originalTitle:String
  let overview: String?
  let popularity: Double
  let posterPath: String?
  let productionCompanies: [ProductionCompany]
  let productionCountries: [ProductionCountry]
  let releaseDate: String
  let revenue:Int
  let runtime: Int?
  let spokenLanguages: [SpokenLanguage]
  let status:String
  let tagline:String?
  let title: String?
  let video: Bool
  let voteAverage: Double
  let voteCount: Int
  
  enum CodingKeys: String, CodingKey {
    case adult
    case backdropPath = "backdrop_path"
//    case belongsToCollection = "belongs_to_collection"
    case budget, genres, homepage, id
    case imdbID = "imdb_id"
    case originalLanguage = "original_language"
    case originalTitle = "original_title"
    case overview, popularity
    case posterPath = "poster_path"
    case productionCompanies = "production_companies"
    case productionCountries = "production_countries"
    case releaseDate = "release_date"
    case revenue, runtime
    case spokenLanguages = "spoken_languages"
    case status, tagline, title, video
    case voteAverage = "vote_average"
    case voteCount = "vote_count"
  }
}



// MARK: - Genre
struct Genre: Codable {
  let id: Int
  let name: String
}

// MARK: - ProductionCompany
struct ProductionCompany: Codable {
  let id: Int
  let logoPath: String?
  let name, originCountry: String
  
  enum CodingKeys: String, CodingKey {
    case id
    case logoPath = "logo_path"
    case name
    case originCountry = "origin_country"
  }
}

// MARK: - ProductionCountry
struct ProductionCountry: Codable {
  let iso3166_1, name: String
  
  enum CodingKeys: String, CodingKey {
    case iso3166_1 = "iso_3166_1"
    case name
  }
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Codable {
  let iso639_1, name: String
  
  enum CodingKeys: String, CodingKey {
    case iso639_1 = "iso_639_1"
    case name
  }
}

extension MovieDetail {

    var formattedBudget: String {

        let budgetInMillions: Double = Double(budget) / 1000000.0

        return String(format: "%.1f", budgetInMillions)

    }

    

    var videoURL: URL? {

        let videos: [String] = [

            "https://multiplatform-f.akamaihd.net/i/multi/will/bunny/big_buck_bunny_,640x360_400,640x360_700,640x360_1000,950x540_1500,.f4v.csmil/master.m3u8",

            "https://multiplatform-f.akamaihd.net/i/multi/april11/sintel/sintel-hd_,512x288_450_b,640x360_700_b,768x432_1000_b,1024x576_1400_m,.mp4.csmil/master.m3u8",

            "https://cph-p2p-msl.akamaized.net/hls/live/2000341/test/master.m3u8",

            "https://y5w8j4a9.ssl.hwcdn.net/andflixhd/tracks-v1a1/index.m3u8",

            "https://dai2.xumo.com/xumocdn/p=roku/amagi_hls_data_xumo1212A-filmrisefreemovies/CDN/1280x720_5000000/chunklist.m3u8"

            

        ]

        let index = self.id % videos.count

        return URL(string: videos[index])

    }

}
