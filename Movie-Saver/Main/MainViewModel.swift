import UIKit

protocol MainViewModel {
    func loadMovies()
    func transitionToAddNewMovie()
    var setupMovies: (([Movie]) -> Void)? { get set }
    var transition: ((DefaultAddMovieView) -> Void)? { get set }
}

final class DefaultMainViewModel: MainViewModel {
    
    // MARK: - Properties
    
    var setupMovies: (([Movie]) -> Void)?
    var transition: ((DefaultAddMovieView) -> Void)?
    
    // MARK: - MainViewModel Methods
    
    func loadMovies() {
        let operationResult = CoreDataManager.instance.getMovies()
        switch operationResult {
        case .success(let movies):
            setupMovies?(movies)
        case .failure(let error):
            print("Failed to load movieList: \(error)")
        }
    }
    
    func transitionToAddNewMovie() {
        let addMovieView = DefaultAddMovieView()
        let addMovieViewModel = DefaultAddMovieViewModel()
        addMovieView.viewModel = addMovieViewModel
        transition?(addMovieView)
    }
}
