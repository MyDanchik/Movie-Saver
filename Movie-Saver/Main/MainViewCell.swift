import UIKit

final class MainViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    private let containerView = UIView()
    private let movieImage = UIImageView()
    private let infoView = UIView()
    private let nameLabel = UILabel()
    private let ratingLabel = UILabel()
    private let defaultRatingMovieLabel = UILabel()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupConstraints()
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupSubviews() {
        contentView.addSubview(containerView)
        containerView.addSubviews(movieImage, infoView)
        infoView.addSubviews(nameLabel, ratingLabel, defaultRatingMovieLabel)
    }
    
    private func setupConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 212).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -22).isActive = true
        
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        movieImage.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        movieImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        movieImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        movieImage.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.57).isActive = true
        
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        infoView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        infoView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        infoView.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 34).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 15).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -15).isActive = true
        
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.bottomAnchor.constraint(equalTo: infoView.bottomAnchor, constant: -50).isActive = true
        ratingLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 50).isActive = true
        
        defaultRatingMovieLabel.translatesAutoresizingMaskIntoConstraints = false
        defaultRatingMovieLabel.bottomAnchor.constraint(equalTo: infoView.bottomAnchor, constant: -50).isActive = true
        defaultRatingMovieLabel.leadingAnchor.constraint(equalTo: ratingLabel.trailingAnchor, constant: 2).isActive = true
    }
    
    private func setupUI() {
        contentView.backgroundColor = .backgroundMainScreen
        
        containerView.backgroundColor = .backgroundCell
        containerView.layer.masksToBounds = false
        containerView.layer.cornerRadius = 8
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowRadius = 10
        containerView.layer.shadowOpacity = 0.30
        
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont(name: "Manrope-Medium", size: 18)
        nameLabel.textAlignment = .center
        nameLabel.textColor = .titleColors
        
        ratingLabel.font = UIFont(name: "Manrope-Bold", size: 18)
        ratingLabel.textAlignment = .center
        ratingLabel.textColor = .titleColors
        
        defaultRatingMovieLabel.font = UIFont(name: "Manrope-Regular", size: 18)
        defaultRatingMovieLabel.text = "/10"
        defaultRatingMovieLabel.textColor = .gray
        
        movieImage.clipsToBounds = true
        movieImage.layer.cornerRadius = 8
        movieImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        movieImage.contentMode = .scaleAspectFill
    }
    
    // MARK: - Public Methods
    
    func configureEntity(movie: Movie) {
        if let imageData = movie.imageMovie, let movieImage = UIImage(data: imageData) {
            self.movieImage.image = movieImage
        } else {
            self.movieImage.image = UIImage(named: "default_image")
        }
        nameLabel.text = movie.nameMovie
        if let rating = Float(movie.ratingMovie ?? "-") {
            ratingLabel.text = String(format: "%.1f", rating)
        } else {
            ratingLabel.text = movie.ratingMovie
        }
    }
}
