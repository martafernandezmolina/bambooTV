//
//  profileData.swift
//  BambooTV
//
//  Created by Marangi  on 01/12/2020.
//

import Foundation
import UIKit


struct ProfileManager {
  
  var myKey = "myKey"
  //  next implementation: should make and enum for rawvalue Key
  
  
  func readProfiles() -> [Profile]{
    
    if let encodedData = UserDefaults.standard.data(forKey: myKey) {
      do {
        let storedProfiles = try JSONDecoder().decode([Profile].self, from: encodedData)
        print(" - storedProfiles: \(storedProfiles)")
        return storedProfiles
        
      } catch {
        print(" - Can't decode [Profiles] T___T I'm sorry (\(error))")
      }
    }
    return []
  }
  
  
  func saveProfile(_ profile: Profile) {
    removeProfile(profile)
    var storedProfiles = readProfiles()
    storedProfiles.append(profile)
    saveAllProfiles(storedProfiles)
    
  }
  
  func removeProfile(_ profile: Profile) {
    var storedProfiles = readProfiles()
    storedProfiles.removeAll(where: { $0 == profile })
    saveAllProfiles(storedProfiles)
  }
  

  func removeObject( profile:Profile){
    var storedProfiles = readProfiles()
    if let index = storedProfiles.firstIndex(of: profile){
      storedProfiles.remove(at:index)}
  }
  
  private func saveAllProfiles(_ profiles: [Profile]) {
    guard let encodedData = try? JSONEncoder().encode(profiles) else { return }
    UserDefaults.standard.set(encodedData, forKey: myKey)
    UserDefaults.standard.synchronize()
    print("\n\nProfileManager - \(#function)")
    print(" - encodedData: \(encodedData)")
    
  }
}

enum ProfileKeys: String {
  case profileList
}

