//
//  moviesList.swift
//  BambooTV
//
//  Created by Marangi  on 04/12/2020.
//

import Foundation


struct MoviesLIst: Codable {
    let page: Int
    let results: [Movie]
    let totalResults, totalPages: Int

    enum CodingKeys: String, CodingKey{
        case page, results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}
