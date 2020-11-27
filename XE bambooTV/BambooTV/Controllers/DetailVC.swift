//
//  ViewController.swift
//  TableView-Navigation
//
//  Created by Marangi  on 29/10/2020.
//

import UIKit

class DetailVC: UIViewController {
  
  @IBOutlet weak var descriptionLabel: UILabel!
  
  var descriptionText = ""
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  
  override func viewWillAppear(_ animated: Bool) {
    descriptionLabel.text = descriptionText
    
    // esta se ejecuta todas las veces
  }
  
  
}



// cuando haya un willaper tento que hacer un prepare para preparar precisamente. en el otro obtienes los fatos y en el prepare alimentas la variable de instancia.
