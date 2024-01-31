import PhotosUI
import UIKit

final class DefaultAddMovieView: UIViewController, UINavigationControllerDelegate{
    var viewModel: AddMovieViewModel!
    
    // MARK: - UI Elements
    
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
    private let descriptionTextView = UITextView()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        setupUI()
        setupBindings()
        setupKeyboard()
        setupTap()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Private Methods
    
    private func setupSubviews() {
        view.addSubviews(addImageView, addImageButton, nameStackView, ratingStackView, releaseStackView, youtubeStackView, descriptionLabel, descriptionTextView)
        nameStackView.addArrangedSubviews(nameTitleLabel, nameLabel, nameChangeButton)
        ratingStackView.addArrangedSubviews(ratingLabel, ratingValueLabel, ratingChangeButton)
        releaseStackView.addArrangedSubviews(releaseLabel, releaseDateLabel, releaseChangeButton)
        youtubeStackView.addArrangedSubviews(youtubeLabel, youtubeLink, youtubeChangeButton)
    }
    
    private func setupConstraints() {
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
        
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 11).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -47).isActive = true
    }
    
    private func setupUI() {
        view.backgroundColor = .backgroundAddScreen
        
        title = "Add new"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .save, primaryAction: UIAction(handler: { [weak self] _ in
            self?.saveMovie()
        }))
        navigationItem.backButtonTitle = ""
        
        addImageView.backgroundColor = .circleAddScreen
        addImageView.layer.masksToBounds = true
        addImageView.layer.cornerRadius = 75
        addImageView.contentMode = .scaleAspectFill
        
        addImageButton.backgroundColor = .clear
        addImageButton.setImage(UIImage(named: "addImageMovieView"), for: .normal)
        addImageButton.addTarget(self, action: #selector(tapOnAlertButton), for: .touchUpInside)
        
        nameStackView.axis = .vertical
        nameStackView.alignment = .center
        
        nameTitleLabel.text = "Name"
        nameTitleLabel.textColor = .titleColors
        nameTitleLabel.font = UIFont(name: "Manrope-Medium", size: 18)
        
        nameLabel.text = "-"
        nameLabel.textColor = .titleColors
        nameLabel.font = UIFont(name: "Manrope-Medium", size: 18)
        
        nameChangeButton.setTitle("Change", for: .normal)
        nameChangeButton.setTitleColor(.systemBlue, for: .normal)
        nameChangeButton.addTarget(self, action: #selector(tapOnNameChangeButton), for: .touchUpInside)
        nameChangeButton.titleLabel?.font = UIFont(name: "Manrope-Medium", size: 18)
        
        ratingStackView.axis = .vertical
        ratingStackView.alignment = .center
        
        ratingLabel.text = "Your Rating"
        ratingLabel.textColor = .titleColors
        ratingLabel.font = UIFont(name: "Manrope-Medium", size: 18)
        
        ratingValueLabel.text = "-"
        ratingValueLabel.textColor = .titleColors
        ratingValueLabel.font = UIFont(name: "Manrope-Medium", size: 18)
        
        ratingChangeButton.setTitle("Change", for: .normal)
        ratingChangeButton.setTitleColor(.systemBlue, for: .normal)
        ratingChangeButton.addTarget(self, action: #selector(tapOnRatingChangeButton), for: .touchUpInside)
        ratingChangeButton.titleLabel?.font = UIFont(name: "Manrope-Medium", size: 18)
        
        releaseStackView.axis = .vertical
        releaseStackView.alignment = .center
        
        releaseLabel.text = "Release Date"
        releaseLabel.textColor = .titleColors
        releaseLabel.font = UIFont(name: "Manrope-Medium", size: 18)
        
        releaseDateLabel.text = "-"
        releaseDateLabel.textColor = .titleColors
        releaseDateLabel.font = UIFont(name: "Manrope-Medium", size: 18)
        
        releaseChangeButton.setTitle("Change", for: .normal)
        releaseChangeButton.setTitleColor(.systemBlue, for: .normal)
        releaseChangeButton.addTarget(self, action: #selector(tapOnReleaseChangeButton), for: .touchUpInside)
        releaseChangeButton.titleLabel?.font = UIFont(name: "Manrope-Medium", size: 18)
        
        youtubeStackView.axis = .vertical
        youtubeStackView.alignment = .center
        
        youtubeLabel.text = "YouTube Link"
        youtubeLabel.textColor = .titleColors
        youtubeLabel.font = UIFont(name: "Manrope-Medium", size: 18)
        
        youtubeLink.text = "-"
        youtubeLink.textColor = .titleColors
        youtubeLabel.font = UIFont(name: "Manrope-Medium", size: 18)
        
        youtubeChangeButton.setTitle("Change", for: .normal)
        youtubeChangeButton.setTitleColor(.systemBlue, for: .normal)
        youtubeChangeButton.addTarget(self, action: #selector(tapOnYoutubeChangeButton), for: .touchUpInside)
        youtubeChangeButton.titleLabel?.font = UIFont(name: "Manrope-Medium", size: 18)
        
        descriptionLabel.text = "Description"
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = UIFont(name: "Manrope-Medium", size: 18)
        descriptionLabel.textColor = .titleColors
        
        descriptionTextView.text = "enter a description"
        descriptionTextView.backgroundColor = .clear
        descriptionTextView.font = UIFont(name: "Manrope-Regular", size: 14)
        descriptionTextView.textColor = .titleColors
    }
    
    @objc func tapOnNameChangeButton() {
        viewModel.transitionName()
    }
    
    @objc func tapOnRatingChangeButton() {
        viewModel.transitionRating()
    }
    
    @objc func tapOnReleaseChangeButton() {
        viewModel.transitionRelease()
    }
    
    @objc func tapOnYoutubeChangeButton() {
        viewModel.transitionYoutube()
    }
    
    private func setupBindings() {
        viewModel.setupAlert = { [weak self] alert in
            self?.present(alert, animated: true)
        }
        
        viewModel.setupPHPicker = { [weak self] picker in
            picker.delegate = self
            self?.present(picker, animated: true)
        }
        
        viewModel.setupUIImagePicker = { [weak self] imagePicker in
            imagePicker.delegate = self
            self?.present(imagePicker, animated: true, completion: nil)
        }
        
        viewModel.transitionNameView = { [weak self] nameScreenView in
            self?.navigationController?.pushViewController(nameScreenView, animated: true)
            nameScreenView.viewModel.setNameClosure = { [weak self] name in
                self?.nameLabel.text = name
            }
        }
        
        viewModel.transitionRatingView = { [weak self] ratingScreenView in
            self?.navigationController?.pushViewController(ratingScreenView, animated: true)
            ratingScreenView.viewModel.setRatingClosure = { [weak self] rating in
                self?.ratingValueLabel.text = rating
            }
        }
        
        viewModel.transitionReleaseView = { [weak self] releaseScreenView in
            self?.navigationController?.pushViewController(releaseScreenView, animated: true)
            releaseScreenView.viewModel.setReleaseClosure = { [weak self] release in
                self?.releaseDateLabel.text = release
            }
        }
        
        viewModel.transitionYoutubeView = { [weak self] youScreenView in
            self?.navigationController?.pushViewController(youScreenView, animated: true)
            youScreenView.viewModel.setYoutubeClosure = { [weak self] youtube in
                self?.youtubeLink.text = youtube
            }
        }
        
        viewModel.saveNewMovieClosure = { [weak self] alert in
            self?.present(alert, animated: true)
            self?.viewModel.ToMainTransition = { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @objc func tapOnAlertButton() {
        viewModel?.tapOnALertButton()
    }
    
    @objc func openGalery() {
        viewModel.openGalery()
    }
    
    @objc func openCamera() {
        viewModel.openCamera()
    }
    
    private func setupImage(image: UIImage?) {
        if let image = image {
            DispatchQueue.main.async {
                self.addImageView.image = image
                self.addImageButton.setImage(UIImage(), for: .normal)
            }
        }
    }
    
    private func saveMovie() {
        guard let imageMovie = addImageView.image?.jpegData(compressionQuality: 1.0), let nameMovie = nameLabel.text, !nameMovie.isEmpty, let ratingMovie = ratingValueLabel.text, !ratingMovie.isEmpty, let releaseDateMovie = releaseDateLabel.text, !releaseDateMovie.isEmpty, let youTubeLinkMovie = youtubeLink.text, !youTubeLinkMovie.isEmpty, let descriptionMovie = descriptionTextView.text, !descriptionMovie.isEmpty else { return }
        
        viewModel.saveNewMovie(imageMovie: imageMovie, nameMovie: nameMovie, ratingMovie: ratingMovie, releaseDateMovie: releaseDateMovie, youTubeLinkMovie: youTubeLinkMovie, descriptionMovie: descriptionMovie)
        
    }
    
    private func setupTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapDone))
        view.addGestureRecognizer(tap)
    }
    
    
    private func setupKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            view.frame.origin.y = -keyboardSize.height
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func keyboardHide() {
        view.frame.origin.y = 0
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    @objc func tapDone() {
        view.endEditing(true)
    }
}

// MARK: - PHPickerViewControllerDelegate

extension DefaultAddMovieView: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        let itemProvider = results.first?.itemProvider
        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { image, _ in
                self.setupImage(image: image as? UIImage)
            }
        }
        dismiss(animated: true)
    }
}

// MARK: - UIImagePickerControllerDelegate

extension DefaultAddMovieView: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            setupImage(image: image)
            viewModel.saveNewMovie(imageMovie: image.jpegData(compressionQuality: 1.0), nameMovie: nameLabel.text, ratingMovie: ratingValueLabel.text, releaseDateMovie: releaseDateLabel.text, youTubeLinkMovie: youtubeLink.text, descriptionMovie: descriptionTextView.text)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
