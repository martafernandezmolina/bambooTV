//
//  detailViewController.swift
//  BambooTV
//
//  Created by Marangi  on 30/11/2020.
//

import Foundation
import UIKit


// new profile mame and foto screen.

var profileManager = ProfileManager()
class SetUserViewController: UIViewController {
  var myKey = "myKey"
  var userDefaultGroup:[Profile] = []
  
  @IBAction func showFotosAction(_ sender: Any) {
    performSegue(withIdentifier: "showFotos", sender: nil)
    
  }
  @IBOutlet weak var showFotos: UIButton!
  @IBOutlet weak var nameUserLabel: UILabel!
  
  @IBAction func detailImgButton2(_ sender: Any) {
    performSegue(withIdentifier: "showFotos", sender: nil)
   
   
  }
  
  
  @IBAction func delateButton(_ sender: Any) {
   
    guard let anOtherProf:Profile = UsersViewModel.selectedProfileAgain else {return}
    profileManager.removeObject(profile: anOtherProf)
    
    self.navigationController?.popViewController(animated: true)
    
  }
  
  @IBOutlet weak var detailImgButton: UIButton!
  
  @IBAction func saveDetailButton(_ sender: Any) {
    print("\n\n SetUserViewController -  \(#function)")
    
    guard let saveInfoName = detailTextField.text else {return}
    let saveInfoNameString = "\(saveInfoName)"
   
    var profile:Profile = Profile(name: "", imageName: "", id: 0)
   
    profile.name = saveInfoNameString
    profile.imageName = UsersViewModel.usersImage ?? "asdasd"
    
    profile.id = UsersViewModel.idImages ?? 1
    print (" -  BEFORE   profileManager.saveProfile(profile): \(profile) ")
    profileManager.saveProfile(profile)
    
      profileManager.saveProfile(profile)
   // profileManager.saveProfile(profile)
    self.navigationController?.popViewController(animated: true)
    
  }
  
  @IBOutlet weak var detailTextField: UITextField!
  
  @IBAction func delate(_ sender: Any) {
  
  
    
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    // nameUserLabel.text = "New User 🥰"
//    var mainImage = UIImage(systemName: "plus.viewfinder")
//    detailImgButton.setImage(mainImage, for:.normal)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    if let image = UIImage(named:UsersViewModel.usersImage ?? ""){
      detailImgButton.setImage(image,for:.normal)
      
    }
  }

}

