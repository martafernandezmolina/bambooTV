//
//  NewsManager.swift
//  BambooTV
//
//  Created by Marangi  on 04/12/2020.
//

import Foundation
import Alamofire

struct MoviesNewsManager {
  // movie/{movie_id}
  private let apiKeyValue: String = "d3e5f2e7aa48d158fe52cb91d420410c"
  
  
  
  func fetchMovieList(success: @escaping(MoviesLIst)-> ()){
    
    let parameters:[String:String] = [EndpointsParameters.apiKey.rawValue: apiKeyValue]
    
    
    AF.request(EndPoints.themoviedb.url,parameters: parameters).validate().responseDecodable(of:MoviesLIst.self){(response) in
      guard let NewMovieList:MoviesLIst = response.value else {
        debugPrint("Request: \(String(describing: response.request))")
        
        debugPrint("Error: \(String(describing: response.error))")
        return
      }
      print("he pasado fetchMovieList")
      success(NewMovieList)
      
    }
    
    
  }
  
  
  func fetchMovieDetail(movie_id:Int,
                        success: @escaping(MovieDetail)-> ()){
    
    let fullUrl = "\(EndPoints.movieDetails.url)/\(movie_id)"

    let parameters:[String:String] = [EndpointsParameters.apiKey.rawValue: apiKeyValue]
    
    AF.request(fullUrl, parameters: parameters).validate().responseDecodable(of:MovieDetail.self){(response) in
      guard let MoveDetail:MovieDetail = response.value else {
        debugPrint("Request: \(String(describing: response.request))")
        
        debugPrint("Error: \(String(describing: response.error))")
        return
      }
      print("he pasado fetchMovieDetail")
      success(MoveDetail)
      
    }
    
    
  }
}
