//
//  Profile.swift
//  BambooTV
//
//  Created by Marangi  on 11/12/2020.
//

import Foundation
import UIKit



//[profile1,Profile2, profile3]

struct Profile: Equatable, Codable {
  var name: String
  var imageName: String
  var id: Int
 
  var image: UIImage? {
    return UIImage(named: imageName)
  }
  
  
  var imagemini: UIImage? {
    return UIImage(named: imageName + "_mini")
  }
  static func == (lhs: Self, rhs: Self) -> Bool {
    return lhs.id == rhs.id
  }
}


