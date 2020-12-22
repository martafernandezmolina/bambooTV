//
//  AvatarDetail.swift
//  BambooTV
//
//  Created by Marangi  on 11/12/2020.
//

import Foundation
import UIKit

// Choose foto screen

var settingUserss = SetUserViewController()

class AvatarDetail: UIViewController{
  
  
  // UsersViewModel.usersImage

 
  
  let avatarImages:[String] = ["avatar_18","avatar_47","avatar_33",
                               "avatar_21",
                               "avatar_50",
                               "avatar_05" ]
  @IBAction func imgOne(_ sender: Any) {
 
    
    UsersViewModel.usersImage = avatarImages[0]
    UsersViewModel.idImages = 0
    self.navigationController?.popViewController(animated: true)
    
  }
  
  @IBAction func imgTwo(_ sender: Any) {
    UsersViewModel.usersImage = avatarImages[1]
    UsersViewModel.idImages = 1
    self.navigationController?.popViewController(animated: true)
  }
  
  @IBAction func imgthree(_ sender: Any) {
    UsersViewModel.usersImage = avatarImages[2]
   
    UsersViewModel.idImages = 2
    self.navigationController?.popViewController(animated: true)
  }
  
  @IBAction func imgFour(_ sender: Any) {
    UsersViewModel.usersImage = avatarImages[3]
    UsersViewModel.idImages = 3
    self.navigationController?.popViewController(animated: true)
    
  }
  
  @IBAction func imgFive(_ sender: Any) {
    UsersViewModel.usersImage = avatarImages[4]
    UsersViewModel.idImages = 4
    self.navigationController?.popViewController(animated: true)
  }
  
  @IBAction func imgSix(_ sender: Any) {
    UsersViewModel.usersImage = avatarImages[5]
   
    UsersViewModel.idImages = 5
    self.navigationController?.popViewController(animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    
    
    
    
  }
  
  
  
  
}
