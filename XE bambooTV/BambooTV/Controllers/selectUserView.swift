//
//  UserView.swift
//  BambooTV
//
//  Created by Marangi  on 30/11/2020.
//

import Foundation
import UIKit

class SelectUser: UIViewController {
  
  
  
  @IBAction func firstButton(_ sender: Any) {
    print("button 1 funciona")
    performSegue(withIdentifier: "goToDetail", sender: nil)
  }
  
    
  @IBAction func secondButton(_ sender: Any) {
    print("button 2 funciona")
    performSegue(withIdentifier: "goToDetail", sender: nil)
  }
  
  
  @IBAction func thirdButton(_ sender: Any) {
    
    print("button 3 funciona")
    performSegue(withIdentifier: "goToDetail", sender: nil)
  }
  
  @IBAction func fourthButton(_ sender: Any) {
    
    print("button 4 funciona")
    performSegue(withIdentifier: "goToDetail", sender: nil)
    
  }
  
}
