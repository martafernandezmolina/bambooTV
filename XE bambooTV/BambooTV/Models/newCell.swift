//
//  newCell.swift
//  BambooTV
//
//  Created by Marangi  on 07/12/2020.
//

import Foundation
import UIKit
import AlamofireImage
//performSegue(withIdentifier: "goToVideoDetail", sender: nil)

protocol MoviesStackCellDelegate {
  func didSelectMovie(movieId: Int)
}
class newCell:UITableViewCell {
  
  @IBOutlet var buttons: [UIButton]!
  
  var delegate: MoviesStackCellDelegate?
  
  @IBAction func stackbuttonAction(_ sender: UIButton) {
    
    if let delegate = delegate {
      delegate.didSelectMovie(movieId: sender.tag)
    }
     
    
  }
  
  @IBOutlet weak var rectangularContraint: NSLayoutConstraint!
  @IBOutlet weak var squaredConstraint: NSLayoutConstraint!
  
  var circularCells:Bool =  false {
    didSet{
      squaredConstraint.isActive = circularCells
      rectangularContraint.isActive = !circularCells
      updateButtonsFormat()
    }
  }
  
  var rowHeight:CGFloat = 0{
    didSet{
      updateButtonsFormat()
    }
  }
  
  var movies:[Movie] = [] {
    didSet{
      updateConverImages()
      updateButtonsID()
    }
  }
  
  
  
  func updateButtonsFormat(){
    for buttons in buttons {
      let radius:CGFloat = circularCells ? rowHeight * 0.5 : 0
      buttons.layer.cornerRadius = radius
      buttons.clipsToBounds = true
      buttons.imageView?.contentMode = .scaleAspectFill
    }
  }
  
  func  updateConverImages(){
    buttons.forEach {
      $0.setImage(nil, for: .normal)
      $0.isHidden = true
    }
    
    zip(movies, buttons).forEach { (movie, button) in
      if let posterPath = movie.posterPath {
        let urlToImage = EndPoints.movieCoverImage.url + posterPath
        if let url = URL(string: urlToImage){
          button.af.setImage(for:.normal, url:url)
          button.isHidden = false
        }
      }
    }
  }
  
  func updateButtonsID(){
    zip(movies, buttons).forEach { (movie, button) in
      button.tag = movie.id
    }
  }
}




