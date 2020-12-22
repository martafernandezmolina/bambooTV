//
//  MainUsers.swift
//  BambooTV
//
//  Created by Marangi  on 21/12/2020.
//  UserView.swift
//  BambooTV
//  Created by Marangi  on 30/11/2020.

import Foundation
import UIKit

class MainUsersController: UIViewController {
  
  var newProfileManager = ProfileManager()
  var profiles:[Profile] = []
  
  
  var myKey = "myKey"
  
  // MARK: - Outlets
  
  @IBOutlet weak var firstUser: UILabel!
  
  @IBOutlet weak var secondUser: UILabel!
  
  @IBOutlet weak var thirdUser: UILabel!
  
  @IBOutlet weak var fourthUser: UILabel!
  
  // botones para setear imagenes
  @IBOutlet weak var boton1outlet: UIButton!
  @IBOutlet weak var boton2outlet: UIButton!
  @IBOutlet weak var boton3outlet: UIButton!
  @IBOutlet weak var boton4outlet: UIButton!
  // MARK: - Actions
  
  @IBAction func firstButtonChoosed(_ sender: UIButton) {
    
    print(" - button 1 funciona")
    
    profiles = newProfileManager.readProfiles()
    
    if profiles.count > 0 {
      
      MoviesViewModel.selectedProfile = profiles[0].name
      dismiss(animated: true)
    } else {
      
      performSegue(withIdentifier: "goToDetail", sender: nil)
    }
  }
  
  
  @IBAction func secondButton(_ sender: Any) {
    print("button 2 funciona")
    
    profiles = newProfileManager.readProfiles()
    
    if  profiles.count  >  1 {
      
      MoviesViewModel.selectedProfile = profiles[1].name
      dismiss(animated: true)
      
    } else {
      performSegue(withIdentifier: "goToDetail", sender: nil)
    }
  }
  
  
  @IBAction func thirdButton(_ sender: Any) {
    profiles = newProfileManager.readProfiles()
    
    if  profiles.count > 2 {
      
      MoviesViewModel.selectedProfile = profiles[2].name
      dismiss(animated: true)
      
    } else {
      
      performSegue(withIdentifier: "goToDetail", sender: nil)
    }
  }
  
  @IBAction func fourthButton(_ sender: Any) {
    profiles = newProfileManager.readProfiles()
    
    if  profiles.count > 3{
      
      MoviesViewModel.selectedProfile = profiles[3].name
      dismiss(animated: true)
    } else {
      performSegue(withIdentifier: "goToDetail", sender: nil)
      
    }
  }
  // crear array y recorrer para setear img. Falta loop
  override func viewWillAppear(_ animated: Bool) {
    print(" \n\n InitialSelectUser - \(#function)")
    
    
    profiles = newProfileManager.readProfiles()
    
    if profiles.count > 0 {
      guard let img =  profiles[0].image else {return}
      boton1outlet.setImage(img, for: .normal)}
    if profiles.count > 1{
      if let image2 =  profiles[1].image{
        boton2outlet.setImage(image2, for: .normal)
      }}
    if profiles.count > 2 {
      if let image3 =  profiles[2].image{
        boton3outlet.setImage(image3, for: .normal)
      }}
    if profiles.count > 3{
      guard let img4 = profiles[3].image else {return}
      boton4outlet.setImage(img4, for: .normal)
      
    }
    
    print (" -  profiles: (profiles)")
    for (index, item) in profiles.enumerated(){
      if index == 0 {
        firstUser.text = profiles[0].name
      } else if index == 1{
        secondUser.text = profiles[1].name
      } else if index == 2 {
        thirdUser.text = profiles[2].name
      } else if index == 3 {
        fourthUser.text = profiles[3].name
      }
    }
  }
  
}





