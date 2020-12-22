//
//  endPoints.swift
//  BambooTV
//
//  Created by Marangi  on 04/12/2020.
//

import Foundation


enum EndPoints:String {
  
  case themoviedb = "https://api.themoviedb.org/3/discover/movie"
  case movieDetails = "https://api.themoviedb.org/3/movie"
  case movieCoverImage = "https://image.tmdb.org/t/p/w500"
  
   var url: String {self.rawValue }
}

enum EndpointsParameters:String {
  case apiKey = "api_key"
  
}



