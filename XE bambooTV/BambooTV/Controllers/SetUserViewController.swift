
//  detailViewController.swift
//  BambooTV
//
//  Created by Marangi  on 30/11/2020.
//

import Foundation
import UIKit


class SetUserViewController: UIViewController {
  
  var profileManager = ProfileManager()
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
    //delateFunction()
    print("not printinnnnnnnggggggg")
    guard let choosedProfile:Profile = UsersViewModel.selectedProfileAgain else {
      print ("no se ha encontrado perfil 😭")
      return}
    profileManager.removeProfile(choosedProfile)
    self.navigationController?.popViewController(animated: true)

    
  }
  
  @IBOutlet weak var detailImgButton: UIButton!
  
  @IBAction func saveDetailButton(_ sender: Any) {
    print("\n\n SetUserViewController -  \(#function)")
    saveUsersDefault()
    self.navigationController?.popViewController(animated: true)
    
  }
  
  @IBOutlet weak var detailTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    if let image = UIImage(named:UsersViewModel.usersImage ?? ""){
      detailImgButton.setImage(image,for:.normal)
    }
  }
  
  func delateFunction(){
    
    guard let choosedProfile:Profile = UsersViewModel.selectedProfileAgain else {return}
    // create the alert
    let alert = UIAlertController(title: "Delate Alert", message: "¿Seguro que quieres borrar?", preferredStyle: UIAlertController.Style.alert)
    
    // add the actions (buttons)
    
    alert.addAction(UIAlertAction(title: "SI 🤩", style: UIAlertAction.Style.destructive, handler:
                                    { action in
                                      print("delate button is working and  should wipe it out ==> \(choosedProfile)")
                                      self.profileManager.removeProfile(choosedProfile)
                                      self.navigationController?.popViewController(animated: true)
                                      print ("se ha borrado")
                                    }))
    
    alert.addAction(UIAlertAction(title: "MEJOR NO 🥺 ", style: UIAlertAction.Style.default, handler: nil))
    
    //    print("delate button is working and  should wipe it out ==> \(choosedProfile)")
    //    profileManager.removeProfile(choosedProfile)
    //profileManager.MyRemoveObject(profile: choosedProfile)
    
  }
  
  func saveUsersDefault(){
    
    guard let saveInfoName = detailTextField.text else {return}
    let saveInfoNameString = "\(saveInfoName)"
    var profile:Profile = Profile(name: "", imageName: "", id: 0)
    
    profile.name = saveInfoNameString
    profile.imageName = UsersViewModel.usersImage ?? "defult text"
    
    profile.id = UsersViewModel.idImages ?? 1
    print (" -  BEFORE   profileManager.saveProfile(profile): \(profile) ")
    profileManager.saveProfile(profile)
    
    
  }
  
}
