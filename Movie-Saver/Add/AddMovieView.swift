import PhotosUI
import UIKit

final class DefaultAddMovieView: UIViewController, UIImagePickerControllerDelegate {
    
    private let addImageView = UIImageView()
    private let addImageButton = UIButton()
    
    private let nameStackView = UIStackView()
    private let nameTitleLabel = UILabel()
    private let nameLabel = UILabel()
    private let nameChangeButton = UIButton()
    
    private let ratingStackView = UIStackView()
    private let ratingLabel = UILabel()
    private let ratingValueLabel = UILabel()
    private let ratingChangeButton = UIButton()
    
    private let releaseStackView = UIStackView()
    private let releaseLabel = UILabel()
    private let releaseDateLabel = UILabel()
    private let releaseChangeButton = UIButton()
    
    private let youtubeStackView = UIStackView()
    private let youtubeLabel = UILabel()
    private let youtubeLink = UILabel()
    private let youtubeChangeButton = UIButton()
    
    private let descriptionLabel = UILabel()
    private let textView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
    }
    
    
    private func addSubviews() {
        view.addSubviews(addImageView, addImageButton, nameStackView, ratingStackView, releaseStackView, youtubeStackView, descriptionLabel, textView)
        nameStackView.addArrangedSubviews(nameTitleLabel, nameLabel, nameChangeButton)
        ratingStackView.addArrangedSubviews(ratingLabel, ratingValueLabel, ratingChangeButton)
        releaseStackView.addArrangedSubviews(releaseLabel, releaseDateLabel, releaseChangeButton)
        youtubeStackView.addArrangedSubviews(youtubeLabel, youtubeLink, youtubeChangeButton)
    }
    
    private func configureConstraints() {
        
        addImageView.translatesAutoresizingMaskIntoConstraints = false
        addImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 27).isActive = true
        addImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        addImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        addImageButton.translatesAutoresizingMaskIntoConstraints = false
        addImageButton.centerXAnchor.constraint(equalTo: addImageView.centerXAnchor).isActive = true
        addImageButton.centerYAnchor.constraint(equalTo: addImageView.centerYAnchor).isActive = true
        addImageButton.heightAnchor.constraint(equalTo: addImageView.heightAnchor, multiplier: 1).isActive = true
        addImageButton.widthAnchor.constraint(equalTo: addImageView.widthAnchor, multiplier: 1).isActive = true
        
        nameStackView.translatesAutoresizingMaskIntoConstraints = false
        nameStackView.topAnchor.constraint(equalTo: addImageButton.bottomAnchor, constant: 32).isActive = true
        nameStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        nameStackView.heightAnchor.constraint(equalToConstant: 84).isActive = true
        nameStackView.widthAnchor.constraint(equalToConstant: 125).isActive = true
        
        ratingStackView.translatesAutoresizingMaskIntoConstraints = false
        ratingStackView.topAnchor.constraint(equalTo: addImageButton.bottomAnchor, constant: 32).isActive = true
        ratingStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        ratingStackView.heightAnchor.constraint(equalToConstant: 84).isActive = true
        ratingStackView.widthAnchor.constraint(equalToConstant: 125).isActive = true
        
        releaseStackView.translatesAutoresizingMaskIntoConstraints = false
        releaseStackView.topAnchor.constraint(equalTo: nameStackView.bottomAnchor, constant: 32).isActive = true
        releaseStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        releaseStackView.heightAnchor.constraint(equalToConstant: 84).isActive = true
        releaseStackView.widthAnchor.constraint(equalToConstant: 125).isActive = true
        
        youtubeStackView.translatesAutoresizingMaskIntoConstraints = false
        youtubeStackView.topAnchor.constraint(equalTo: ratingStackView.bottomAnchor, constant: 32).isActive = true
        youtubeStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        youtubeStackView.heightAnchor.constraint(equalToConstant: 84).isActive = true
        youtubeStackView.widthAnchor.constraint(equalToConstant: 125).isActive = true
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: releaseStackView.bottomAnchor, constant: 36).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 11).isActive = true
        textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -47).isActive = true
    }
    
    private func configureUI() {
        
        view.backgroundColor = .backgroundAddScreen
        
        title = "Add new"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: nil, action: nil)
        navigationItem.backButtonTitle = ""
        
        addImageView.backgroundColor = .circleAddScreen
        addImageView.layer.masksToBounds = true
        addImageView.layer.cornerRadius = 75
        
        addImageButton.backgroundColor = .clear
        addImageButton.setImage(UIImage(named: "addImageMovieView"), for: .normal)
        
        nameStackView.axis = .vertical
        nameStackView.alignment = .center
        
        nameTitleLabel.text = "Name"
        nameTitleLabel.textColor = .black
        
        nameLabel.text = "-"
        nameLabel.textColor = .black
        
        nameChangeButton.setTitle("Change", for: .normal)
        nameChangeButton.setTitleColor(.systemBlue, for: .normal)
        
        ratingStackView.axis = .vertical
        ratingStackView.alignment = .center
        
        ratingLabel.text = "Your Rating"
        ratingLabel.textColor = .black
        
        ratingValueLabel.text = "-"
        ratingValueLabel.textColor = .black
        
        ratingChangeButton.setTitle("Change", for: .normal)
        ratingChangeButton.setTitleColor(.systemBlue, for: .normal)
        
        releaseStackView.axis = .vertical
        releaseStackView.alignment = .center
        
        releaseLabel.text = "Release Date"
        releaseLabel.textColor = .black
        
        releaseDateLabel.text = "-"
        releaseDateLabel.textColor = .black
        
        releaseChangeButton.setTitle("Change", for: .normal)
        releaseChangeButton.setTitleColor(.systemBlue, for: .normal)
        
        youtubeStackView.axis = .vertical
        youtubeStackView.alignment = .center
        
        youtubeLabel.text = "YouTube Link"
        youtubeLabel.textColor = .black
        
        youtubeLink.text = "-"
        youtubeLink.textColor = .black
        
        youtubeChangeButton.setTitle("Change", for: .normal)
        youtubeChangeButton.setTitleColor(.systemBlue, for: .normal)
        
        descriptionLabel.text = "Description"
        descriptionLabel.textAlignment = .center
        
        textView.text = "Description"
    }
}
