//
//  UserView.swift
//  BambooTV
//
//  Created by Marangi  on 30/11/2020.
//

import Foundation
import UIKit

class InitialSelectUser: UIViewController {
  var oldimage = SetUserViewController()
  var editable:Bool = false
  var newProfileManager = ProfileManager()
  var profiles:[Profile] = []
  var filmElements = FilmsViewController()
  var myKey = "myKey"
  
  // MARK: - Edit y Listo
  
  @IBOutlet weak var editOutlet: UIBarButtonItem!

  @IBAction func editAction(_ sender: Any) {
    ListoOutlet.show()
    editOutlet.hide()
    editable = true
  }
  @IBOutlet weak var ListoOutlet: UIBarButtonItem!
  
  
  @IBAction func ListoAction(_ sender: Any) {
    
    ListoOutlet.hide()
    editOutlet.show()
    editable = false
    
    
  }
  
  // MARK: - Outlets
  
  @IBOutlet weak var firstUser: UILabel!
  @IBOutlet weak var secondUser: UILabel!
  @IBOutlet weak var thirdUser: UILabel!
  @IBOutlet weak var fourthUser: UILabel!
  
  // MARK: - SET BUTTONS IMAGES
  
  @IBOutlet weak var boton1outlet: UIButton!
  @IBOutlet weak var boton2outlet: UIButton!
  @IBOutlet weak var boton3outlet: UIButton!
  @IBOutlet weak var boton4outlet: UIButton!
 
  
  // MARK: - Actions
  
  @IBAction func firstButtonChoosed(_ sender: UIButton) {
    
    print(" - button 1 funciona")
    
    profiles = newProfileManager.readProfiles()
    
    if profiles.count > 0 && editable == false {
      
      MoviesViewModel.selectedProfile = profiles[0].name
      dismiss(animated: true)
    } else{
      
      performSegue(withIdentifier: "goToDetail", sender: nil)
    }
  }
  
  
  @IBAction func secondButton(_ sender: Any) {
    print("Button two is ok 🥳")
    
    profiles = newProfileManager.readProfiles()
    
    if  profiles.count  >  1  && editable == false {
      
      MoviesViewModel.selectedProfile = profiles[1].name
    

      dismiss(animated: true)
      
    } else {
      UsersViewModel.selectedProfileAgain? = profiles[1]
      performSegue(withIdentifier: "goToDetail", sender: nil)
    }
  }
  
  
  @IBAction func thirdButton(_ sender: Any) {
    profiles = newProfileManager.readProfiles()
    
    if  profiles.count > 2  && editable == false {
      MoviesViewModel.selectedProfile = profiles[2].name
     

      dismiss(animated: true)
      
    } else {
      UsersViewModel.selectedProfileAgain? = profiles[2]
      performSegue(withIdentifier: "goToDetail", sender: nil)
    }
    
  }
  
  @IBAction func fourthButton(_ sender: Any)  {
    profiles = newProfileManager.readProfiles()
    
    if  profiles.count > 3 && editable == false{
      
      MoviesViewModel.selectedProfile = profiles[3].name
    
      
      dismiss(animated: true)
    } else {
      UsersViewModel.selectedProfileAgain? = profiles[3]
      performSegue(withIdentifier: "goToDetail", sender: nil)

      
    }
  }
  // Mejor hacer array y recorrer para setear img. Falta loop!! 😱
  
  override func viewWillAppear(_ animated: Bool) {
    resetScreenButtons()
    
    print(" \n\n InitialSelectUser - \(#function)")
    ListoOutlet.hide()
    editable = false
    
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
  override func viewWillDisappear(_ animated: Bool) {
    editable = false
    ListoOutlet.hide()
    editOutlet.show()
  }
  
  func resetScreenButtons(){
    
    let usersEmptyLabels = [firstUser,secondUser,thirdUser,fourthUser]
    let profilesEmptyImages =  [boton1outlet,boton2outlet,boton3outlet,boton4outlet]
    usersEmptyLabels.enumerated().forEach{(index,element) in
      
      if  index == 0 {
        element?.text = "USER"
      } else if index == 1 {
        element?.text = "USER"
        
      } else if index == 2{
        element?.text = "USER"
      } else if  index == 3{
        element?.text = "USER"
      }
      
    }
    
    var indexArray:Int = 0
    
    while indexArray < profilesEmptyImages.count{
      profilesEmptyImages[indexArray]?.backgroundColor = .black
      profilesEmptyImages[indexArray]?.setImage(UIImage(systemName: "plus"), for: .normal)
      indexArray += 1
    }
    
  }
  
  
  
  
  
  
}
