import UIKit
import WebKit

final class DefaulFullInfoView: UIViewController {
    
    // MARK: - UI Elements
    
    private let imageView = UIImageView()
    private let infoView = UIView()
    private let movieNameLabel = UILabel()
    private let ratingMovieLabel = UILabel()
    private let defaultRatingMovieLabel = UILabel()
    private let releaseDateLabel = UILabel()
    private let descriptionTextView = UITextView()
    private let youtubeWebView = WKWebView()
    private let starImageView = UIImageView()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        setupUI()
    }
    
    // MARK: - Private Methods
    
    private func setupSubviews() {
        view.addSubviews(imageView, infoView)
        infoView.addSubviews(movieNameLabel, starImageView, ratingMovieLabel, defaultRatingMovieLabel, releaseDateLabel, descriptionTextView, youtubeWebView)
    }
    
    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 296).isActive = true
        
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.topAnchor.constraint(equalTo: view.topAnchor, constant: 257).isActive = true
        infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        infoView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
        movieNameLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 29).isActive = true
        movieNameLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 19).isActive = true
        movieNameLabel.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -18).isActive = true
        movieNameLabel.heightAnchor.constraint(equalToConstant: 65).isActive = true
        
        starImageView.translatesAutoresizingMaskIntoConstraints = false
        starImageView.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 14).isActive = true
        starImageView.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 19).isActive = true
        starImageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        starImageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        
        ratingMovieLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingMovieLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 14).isActive = true
        ratingMovieLabel.leadingAnchor.constraint(equalTo: starImageView.trailingAnchor, constant: 8).isActive = true
        ratingMovieLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        defaultRatingMovieLabel.translatesAutoresizingMaskIntoConstraints = false
        defaultRatingMovieLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 14).isActive = true
        defaultRatingMovieLabel.leadingAnchor.constraint(equalTo: ratingMovieLabel.trailingAnchor, constant: 2).isActive = true
        defaultRatingMovieLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 14).isActive = true
        releaseDateLabel.leadingAnchor.constraint(equalTo: defaultRatingMovieLabel.trailingAnchor, constant: 8).isActive = true
        releaseDateLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.topAnchor.constraint(equalTo: ratingMovieLabel.bottomAnchor, constant: 13).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 19).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -19).isActive = true
        descriptionTextView.heightAnchor.constraint(equalToConstant: 138).isActive = true
        
        youtubeWebView.translatesAutoresizingMaskIntoConstraints = false
        youtubeWebView.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 18).isActive = true
        youtubeWebView.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -19).isActive = true
        youtubeWebView.heightAnchor.constraint(equalToConstant: 196).isActive = true
        youtubeWebView.bottomAnchor.constraint(equalTo: infoView.bottomAnchor, constant: -52).isActive = true
    }
    
    private func setupUI() {
        view.backgroundColor = .backgroundAddScreen
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFill
        
        infoView.backgroundColor = .backgroundAddScreen
        infoView.layer.cornerRadius = 16
        
        movieNameLabel.backgroundColor = .clear
        movieNameLabel.font = UIFont(name: "Manrope-Bold", size: 24)
        movieNameLabel.numberOfLines = 0
        movieNameLabel.textColor = .titleColors
        
        starImageView.image = UIImage(systemName: "star.fill")
        starImageView.tintColor = .systemYellow
        
        ratingMovieLabel.backgroundColor = .clear
        ratingMovieLabel.font = UIFont(name: "Manrope-Bold", size: 14)
        ratingMovieLabel.textColor = .titleColors
        
        defaultRatingMovieLabel.text = "/10"
        defaultRatingMovieLabel.font = UIFont(name: "Manrope-Regular", size: 14)
        defaultRatingMovieLabel.textColor = .gray
        
        releaseDateLabel.textColor = .gray
        releaseDateLabel.font = UIFont(name: "Manrope-Regular", size: 14)
        
        descriptionTextView.font = UIFont(name: "Manrope-Regular", size: 14)
        descriptionTextView.backgroundColor = .clear
        descriptionTextView.textColor = .titleColors
        descriptionTextView.isEditable = false
    }
    
    // MARK: - Public Methods
    
    func configureFullMovie(movie: Movie) {
        if let imageData = movie.imageMovie, let movieImage = UIImage(data: imageData) {
            imageView.image = movieImage
        } else {
            imageView.image = UIImage(named: "default_image")
        }
        
        movieNameLabel.text = movie.nameMovie
        ratingMovieLabel.text = movie.ratingMovie
        
        if let releaseDate = movie.releaseDateMovie {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            if let date = dateFormatter.date(from: releaseDate) {
                let yearFormatter = DateFormatter()
                yearFormatter.dateFormat = "yyyy"
                releaseDateLabel.text = yearFormatter.string(from: date)
            }
        }
        
        descriptionTextView.text = movie.descriptionMovie
        
        if let youTubeLink = movie.youTubeLinkMovie, let url = URL(string: youTubeLink) {
            youtubeWebView.load(URLRequest(url: url))
        }
    }
}
