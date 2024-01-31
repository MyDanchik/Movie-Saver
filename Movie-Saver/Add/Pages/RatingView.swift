import UIKit

// MARK: - DefaultRatingView

final class DefaultRatingView: UIViewController {

    // MARK: - Properties

    var viewModel: RatingViewModel!

    private let yourRatingLabel = UILabel()
    private let pickerView = UIPickerView()
    private let saveButton = UIButton()
    
    private let ratings: [Float] = Array(stride(from: 0.0, through: 10.0, by: 0.1))
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        setupUI()
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    // MARK: - Setup Methods

    private func setupSubviews() {
        view.addSubviews(yourRatingLabel, pickerView, saveButton)
    }

    private func setupConstraints() {
        
        yourRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        yourRatingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 124).isActive = true
        yourRatingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 88).isActive = true
        yourRatingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -87).isActive = true
        yourRatingLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true
 
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.topAnchor.constraint(equalTo: yourRatingLabel.bottomAnchor, constant: 32).isActive = true
        pickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        pickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        pickerView.heightAnchor.constraint(equalToConstant: 131).isActive = true

        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.topAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: 32).isActive = true
        saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 148).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -148).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }
    
    private func setupUI() {

        view.backgroundColor = .backgroundAddScreen

        yourRatingLabel.text = "Your Rating"
        yourRatingLabel.textColor = .titleColors
        yourRatingLabel.textAlignment = .center
        yourRatingLabel.font = UIFont(name: "Manrope-Medium", size: 24)

        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.systemBlue, for: .normal)
        saveButton.addTarget(self, action: #selector(tapOnSaveButton), for: .touchUpInside)
        saveButton.titleLabel?.font = UIFont(name: "Manrope-Medium", size: 18)
    }

    // MARK: - Helper Methods

    private func configureBindings() {
        viewModel.setRatingClosure = { [weak self] rating in
            self?.yourRatingLabel.text = rating
        }
    }
    
    private func getRating() -> String? {
        let selectedRow = pickerView.selectedRow(inComponent: 0)
        guard selectedRow < ratings.count else { return nil }
        let selectedValue = ratings[selectedRow]
        return String(format: "%.1f", selectedValue)
    }
    
    // MARK: - Actions

    @objc func tapOnSaveButton() {
        if let rating = getRating() {
            viewModel.setRating(rating: rating)
            navigationController?.popViewController(animated: true)
        }
    }
}

// MARK: - UIPickerViewDelegate & UIPickerViewDataSource

extension DefaultRatingView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ratings.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(format: "%.1f", ratings[row])
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedValue = ratings[row]
        print("Selected value: \(selectedValue)")
    }
}
