//
//  FilmsVC.swift
//  BambooTV
//   forfistbutton:{ if indexpath.secton = 1 & moviesordered.count >1
//selectedmovieID =  movie[1].id
//}
//  Created by Marangi  on 03/12/2020.
// MoviesViewModel.selectedProfile

import UIKit

private let reuseIdentifier = String(describing:newCell.self)
var profilesManage = ProfileManager()

class FilmsViewController: UITableViewController, MoviesStackCellDelegate {
 
  func didSelectMovie(movieId: Int) {
    MoviesViewModel.selectedMovieID = movieId
    performSegue (withIdentifier: "goToVideoDetail", sender: self)
    print("Movie selected: \(movieId)")
    
  }
  
  var moviesManager = MoviesNewsManager()
  var movies:[Movie] = []
  
  private var profileSelectionScreenNeeded: Bool = true
  var myKey:String = "myKey"
  @IBOutlet weak var userSelectionTableButton: UIBarButtonItem!

  @IBAction func userSelectionButton(_ sender: Any) {
    
    performSegue(withIdentifier: "goToProfileSelection", sender: nil)
    //dismiss(animated: true)
  }
  
  
  // MARK: - Life cycle methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let nib = UINib (nibName: reuseIdentifier, bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
    fetchMovies()
    userSelectionTableButton.title = MoviesViewModel.selectedProfile
    
  }
  private func fetchMovies() {
    
    moviesManager.fetchMovieList(){ moviesList in
      self.movies = moviesList.results
      self.tableView.reloadData()
      
    }
  }
  
  func fetcMovieDetail(){
    guard let selectedMovieId = MoviesViewModel.selectedMovieID else {return}
    moviesManager.fetchMovieDetail(movie_id: selectedMovieId) { (MovieDetail) in
    MovieDetail.id
   
      }
    }
  
  override func viewWillAppear(_ animated: Bool) {
    print ("turururur")
    let gettingInformationFromUser = profilesManage.readProfiles()
    userSelectionTableButton.title = MoviesViewModel.selectedProfile

  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("FilmsVC - \(#function)")
    showProfileSelectionIfNeeded()
    //cosa =  textfielf. en posicion
    // si es nil pasa x pantalla
    // if button  nil
    
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return SectionType.allCases.count
    
    // 5 caseIterable(protocol) => lo covierte en array
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell =  tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! newCell
    
    guard let sectionType: SectionType = SectionType(rawValue: indexPath.section) else {
      return cell
    }
    
    cell.rowHeight = sectionType.rowHeight
    cell.circularCells = sectionType.isCircular
    cell.delegate = self
    cell.movies = moviesForSection(indexPath.section)
    
    //7cell.delegate = self
    return cell
    
  }
  
  
  
  override func tableView(_ tableView: UITableView,
                          numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return 1
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    guard let sectionType: SectionType = SectionType(rawValue: indexPath.section) else {
      return 100
      
    }
    return sectionType.rowHeight
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    guard let sectionType: SectionType = SectionType(rawValue: section) else {
      return "-"
    }
    return sectionType.title
  }
  
  // MARK: - Methods
  
  func showProfileSelectionIfNeeded() {
    print("\n\nFilmsVC - \(#function)")
    
    if profileSelectionScreenNeeded {
      print(" - goToProfileSelection()")
      goToProfileSelection()
      profileSelectionScreenNeeded = false
      
    }
    
  }

  // MARK: - Transition
  
  private func goToProfileSelection() {
    print("\n\nFilmsVC - \(#function)")
    print(" - performSegue(...)")
    performSegue(withIdentifier: "goToProfileSelection",
                 sender: self)
  }
}
extension FilmsViewController {
  
  enum SectionType: Int, CaseIterable {
    //[ mostVoted, recentlyAdded, mostPopular, discover,internationalMovies] => rawvalue(indexpath)
    case mostVoted
    case recentlyAdded
    case mostPopular
    case discover
    case internationalMovies
    
    
    var title: String {
      switch self {
      case .mostPopular:
        return "Populares"
      case .recentlyAdded:
        return "Recientes"
      case .mostVoted:
        return "Más votados"
      case .discover:
        return "Películas que te gustarán"
      case .internationalMovies:
        return "Cine internacional"
      }
    }
    
    var rowHeight: CGFloat {
      switch self {
      case .mostPopular:
        return 300
      default:
        return 150
      }
    }
    
    var isCircular: Bool {
      switch self {
      case .mostVoted:
        return true
      default:
        return false
      }
    }
    
  }
  private func moviesForSection(_ section: Int) -> [Movie] {
    
    let allMovies = self.movies
    guard let sectionType: SectionType = SectionType(rawValue: section)
    else { return [] }
   
    switch sectionType {
    
    case .mostPopular:
      
      return allMovies.sorted{ $0.popularity > $1.popularity }
      
    case .recentlyAdded:
      
      return allMovies.sorted{ $0.releaseDate > $1.releaseDate }
      
    case .mostVoted:
      
      return allMovies.sorted{ $0.voteAverage > $1.voteAverage }
      
    case .discover:
      
      return allMovies.shuffled()
      
    case .internationalMovies:
      
      return allMovies.filter{ $0.originalLanguage != "en" }
    }
  }
}

