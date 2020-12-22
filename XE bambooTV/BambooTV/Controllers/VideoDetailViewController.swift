//
//  VideoController.swift
//  BambooTV
//
//  Created by Marangi  on 07/12/2020.
//

import Foundation
import AVKit
import AVFoundation
import UIKit



class VideoViewController: UIViewController {
  
  let moviesManager = MoviesNewsManager()
  var movieDetail: MovieDetail?
  
  
  // var movieDetail: MovieDetail
  
  let  videoUrl:String = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4"
  var playerViewController = AVPlayerViewController()
  var playerView = AVPlayer() // this one shows on the playerViewController  => that's why we need both of them.
  
  @IBOutlet weak var titleOutlet: UILabel!
  
  @IBOutlet weak var popularityOutlet: UILabel!
  @IBOutlet weak var textDescription: UITextView!
  @IBOutlet weak var playOutlet: UIButton!
  @IBAction func playButton(_ sender: Any) {
    playVideo()
  }
  @IBOutlet weak var videoContainer:UIView!
  @IBOutlet var downloadButtons: [UIButton]!
  @IBOutlet weak var thumbnailImageView: UIImageView!
  
  override func viewDidLoad() {
    videoDetail()
    
    //playOutlet.isHidden = true
    downloadButtons.forEach { (button) in
      button.layer.cornerRadius = 10
    }
    
  }
  
  // funcion miniatura
  
  func getVideoFromImafe (url:URL,
                          completion: @escaping((_ image: UIImage)-> Void)) {
    DispatchQueue.global().async {
      let asset = AVAsset(url: url)
      let avAssetImageGenerator = AVAssetImageGenerator(asset: asset)
      avAssetImageGenerator.appliesPreferredTrackTransform = true
      
      
      let thumbnailTime = CMTimeMake(value: 7, timescale: 1)
      do {
        let cgThumbImage = try avAssetImageGenerator.copyCGImage(at: thumbnailTime, actualTime: nil)
        let thumbImage = UIImage(cgImage: cgThumbImage)
        DispatchQueue.main.async {
          completion(thumbImage)
        }
        
      } catch {
        print (error.localizedDescription)
      }
    }
    
  }
  
  // Mark FullScreenVideo
    
  func playVideo(){
    let url:URL = URL(string: videoUrl)!
    playerView = AVPlayer(url: url as URL)
    playerViewController.player = playerView
    
    //  Mark present playerviewController
    
    self.present(playerViewController, animated: true){
      self.playerViewController.player?.play()
    }
  }
  
  
  func videoDetail(){
    
    guard  let selectedMovie = MoviesViewModel.selectedMovieID else {return}
    
    moviesManager.fetchMovieDetail(movie_id: selectedMovie) { (movieDetail) in
      self.movieDetail = movieDetail

      if let movieInformation:MovieDetail = movieDetail {
      

      self.titleOutlet.text  = movieInformation.title
      self.popularityOutlet.text = "\(movieInformation.popularity)"
      self.textDescription.text  = "\(movieInformation.overview!)"
      self.configurePlayer(videoURL: movieInformation.videoURL!)
      
      }
      
      /*let convertedVideoUrl = URL(string: self.videoUrl)
       self.getVideoFromImafe(url: convertedVideoUrl!) { (thumbImage) in
       self.thumbnailImageView.image  = thumbImage
       } */
    }
    
  }
  
  private func configurePlayer(videoURL: URL) {
    
    // Solución #2: usando AVPlayerViewController
    
    // Muestra los controles típicos de un vídeo (play, pause, pantalla completa, etc.)
    
    let player = AVPlayer(url: videoURL)
    let playerViewController = AVPlayerViewController()
    playerViewController.player = player
    guard let playerView = playerViewController.view else {
      
      debugPrint("Error: player view is nil")
      return
    }
    
    self.addChild(playerViewController)
    videoContainer.addSubview(playerView)
    playerViewController.didMove(toParent: self)
    
    playerView.translatesAutoresizingMaskIntoConstraints = false
    let topConstraint = NSLayoutConstraint(item: playerView, attribute: .top, relatedBy: .equal, toItem: videoContainer, attribute: .top, multiplier: 1, constant: 0)
    
    let bottomConstraint = NSLayoutConstraint(item: playerView, attribute: .bottom, relatedBy: .equal, toItem: videoContainer, attribute: .bottom, multiplier: 1, constant: 0)
    
    let leadingConstraint = NSLayoutConstraint(item: playerView, attribute: .leading, relatedBy: .equal, toItem: videoContainer, attribute: .leading, multiplier: 1, constant: 0)
    
    let trailingConstraint = NSLayoutConstraint(item: playerView, attribute: .trailing, relatedBy: .equal, toItem: videoContainer, attribute: .trailing, multiplier: 1, constant: 0)
    
    NSLayoutConstraint.activate([topConstraint, bottomConstraint, leadingConstraint, trailingConstraint])
 
    player.play()
    
  }

}
