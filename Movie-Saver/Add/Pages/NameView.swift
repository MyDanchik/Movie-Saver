import UIKit

// MARK: - DefaultNameView

final class DefaultNameView: UIViewController {
    var viewModel: NameViewModel!
    
    // MARK: - UI Elements
    
    private let movieNameLabel = UILabel()
    private let textField = UITextField()
    private let lineTextFieldLabel = UILabel()
    private let saveButton = UIButton()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        setupUI()
    }
    
    // MARK: - Private Methods
    
    private func setupSubviews() {
        view.addSubviews(movieNameLabel, textField, lineTextFieldLabel, saveButton)
    }
    
    private func setupConstraints() {
        movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
        movieNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 124).isActive = true
        movieNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 88).isActive = true
        movieNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -87).isActive = true
        movieNameLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 42).isActive = true
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        lineTextFieldLabel.translatesAutoresizingMaskIntoConstraints = false
        lineTextFieldLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 0).isActive = true
        lineTextFieldLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lineTextFieldLabel.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineTextFieldLabel.widthAnchor.constraint(equalTo: textField.widthAnchor, multiplier: 1).isActive = true
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 42).isActive = true
        saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 148).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -148).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }
    
    private func setupUI() {
        view.backgroundColor = .backgroundAddScreen
        
        movieNameLabel.text = "Film Name"
        movieNameLabel.textAlignment = .center
        movieNameLabel.font = UIFont(name: "Manrope-Medium", size: 24)
        movieNameLabel.textColor = .titleColors
        
        textField.placeholder = "Name"
        
        lineTextFieldLabel.backgroundColor = .systemGray4
        
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.systemBlue, for: .normal)
        saveButton.addTarget(self, action: #selector(tapOnSave), for: .touchUpInside)
        saveButton.titleLabel?.font = UIFont(name: "Manrope-Medium", size: 18)
    }
    
    private func getText() -> String? {
        return textField.text
    }
    
    // MARK: - Action
    
    @objc func tapOnSave() {
        if let name = getText() {
            viewModel.setName(name: name)
            navigationController?.popViewController(animated: true)
        }
    }
}
