import PhotosUI
import UIKit

// MARK: - AddMovieViewModel Protocol

protocol AddMovieViewModel {
    func tapOnALertButton()
    func openGalery()
    func openCamera()
    var setupAlert: ((UIAlertController) -> Void)? { get set }
    var setupPHPicker: ((PHPickerViewController) -> Void)? { get set }
    var setupUIImagePicker: ((UIImagePickerController) -> Void)? { get set }
    var ToMainTransition: (() -> Void)? { get set }
    
    func transitionName()
    func transitionRating()
    func transitionRelease()
    func transitionYoutube()
    
    var transitionNameView: ((DefaultNameView) -> Void)? { get set }
    var transitionRatingView: ((DefaultRatingView) -> Void)? { get set }
    var transitionReleaseView: ((DefaultReleaseView) -> Void)? { get set }
    var transitionYoutubeView: ((DefaultYoutubeView) -> Void)? { get set }
    
    func saveNewMovie(imageMovie: Data?, nameMovie: String?, ratingMovie: String?, releaseDateMovie: String?, youTubeLinkMovie: String?, descriptionMovie: String?)
    var saveNewMovieClosure: ((UIAlertController) -> Void)? { get set }
}

// MARK: - DefaultAddMovieViewModel

final class DefaultAddMovieViewModel: AddMovieViewModel {
    var transitionRatingView: ((DefaultRatingView) -> Void)?
    var transitionReleaseView: ((DefaultReleaseView) -> Void)?
    var transitionYoutubeView: ((DefaultYoutubeView) -> Void)?
    var transitionNameView: ((DefaultNameView) -> Void)?
    var ToMainTransition: (() -> Void)?
    var setupUIImagePicker: ((UIImagePickerController) -> Void)?
    var setupPHPicker: ((PHPickerViewController) -> Void)?
    var setupAlert: ((UIAlertController) -> Void)?
    
    // MARK: - Transition Methods
    
    func transitionName() {
        let nameView = DefaultNameView()
        let nameViewModel = NameViewModel()
        nameView.viewModel = nameViewModel
        transitionNameView?(nameView)
    }
    
    func transitionRating() {
        let ratingView = DefaultRatingView()
        let ratingViewModel = RatingViewModel()
        ratingView.viewModel = ratingViewModel
        transitionRatingView?(ratingView)
    }
    
    func transitionRelease() {
        let releaseView = DefaultReleaseView()
        let releaseViewModel = ReleaseViewModel()
        releaseView.viewModel = releaseViewModel
        transitionReleaseView?(releaseView)
    }
    
    func transitionYoutube() {
        let youtubeView = DefaultYoutubeView()
        let youtubeViewModel = YoutubeViewModel()
        youtubeView.viewModel = youtubeViewModel
        transitionYoutubeView?(youtubeView)
    }
    
    func tapOnALertButton() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        alert.addAction(UIAlertAction(title: "Galery", style: .default, handler: { _ in
            self.openGalery()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
        }))
        setupAlert?(alert)
    }
    
    func openGalery() {
        var configurator = PHPickerConfiguration(photoLibrary: .shared())
        configurator.filter = .images
        configurator.selectionLimit = 1
        let picker = PHPickerViewController(configuration: configurator)
        setupPHPicker?(picker)
    }
    
    func openCamera() {
        let imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
        } else {
            print("Камера не доступна")
        }
        setupUIImagePicker?(imagePicker)
    }

    
    // MARK: - Movie Saving
    
    var saveNewMovieClosure: ((UIAlertController) -> Void)?
    
    func saveNewMovie(imageMovie: Data?, nameMovie: String?, ratingMovie: String?, releaseDateMovie: String?, youTubeLinkMovie: String?, descriptionMovie: String?) {
        
        guard let imageMovie = imageMovie, imageMovie.count > 0,
              let nameMovie = nameMovie, nameMovie != "-", nameMovie != "",
              let ratingMovie = ratingMovie, ratingMovie != "-",
              let releaseDateMovie = releaseDateMovie, releaseDateMovie != "-",
              let youTubeLinkMovie = youTubeLinkMovie, youTubeLinkMovie != "-", youTubeLinkMovie != "",
              let descriptionMovie = descriptionMovie, descriptionMovie != "enter a description", descriptionMovie != ""
        else {
            let alertEmpty = UIAlertController(title: "Заполните все поля", message: "", preferredStyle: .alert)
            alertEmpty.addAction(UIAlertAction(title: "OK", style: .destructive, handler: { _ in
            }))
            saveNewMovieClosure?(alertEmpty)
            return
        }
        let result = CoreDataManager.instance.saveMovie(imageMovie: imageMovie, nameMovie: nameMovie, ratingMovie: ratingMovie, releaseDateMovie: releaseDateMovie, youTubeLinkMovie: youTubeLinkMovie, descriptionMovie: descriptionMovie)
        
        switch result {
        case .success:
            print("Saved")
            let alertSuccess = UIAlertController(title: "Фильм добавлен", message: "", preferredStyle: .alert)
            alertSuccess.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                self.ToMainTransition?()
            }))
            saveNewMovieClosure?(alertSuccess)
        case .failure(let failure):
            print(failure)
            let alertError = UIAlertController(title: "Произошла ошибка", message: "", preferredStyle: .alert)
            alertError.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: { _ in
            }))
            saveNewMovieClosure?(alertError)
        }
    }
}
