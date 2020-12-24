
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
    delateFunction()
    
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
    guard let choosedProfile:Profile = UsersViewModel.selectedProfileAgain else {
      print ("no se ha encontrado perfil 😭")
      return}
    
    let alert = UIAlertController(title: "Espera!", message: "¿Seguro que quieres borrar?", preferredStyle: .alert)
    
    let cancel = UIAlertAction(title: "Cancelar 🥺 ", style: .destructive, handler: { action in
    
      
    })
    alert.addAction(cancel)
    
    let aceptar = UIAlertAction(title: "Claro!", style: .default, handler: { action in
      
      print("delate button is working and  should wipe it out ==> \(choosedProfile)")
      self.profileManager.removeProfile(choosedProfile)
      self.navigationController?.popViewController(animated: true)
      print ("se ha borrado")
      
    })
    alert.addAction(aceptar)
    
    
    DispatchQueue.main.async(execute: {
      self.present(alert, animated: true)
    })
    
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
