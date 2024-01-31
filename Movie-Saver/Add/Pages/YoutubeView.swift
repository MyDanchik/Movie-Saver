import UIKit

// MARK: - DefaultYoutubeView

final class DefaultYoutubeView: UIViewController {

    var viewModel: YoutubeViewModel!

    private let youtubeLinkLabel = UILabel()
    private let textField = UITextField()
    private let lineTextFieldLabel = UILabel()
    private let saveButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        setupUI()
    }

    // MARK: - Setup

    private func setupSubviews() {
        view.addSubviews(youtubeLinkLabel, textField, lineTextFieldLabel, saveButton)
    }

    private func setupConstraints() {
        youtubeLinkLabel.translatesAutoresizingMaskIntoConstraints = false
        youtubeLinkLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 124).isActive = true
        youtubeLinkLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 88).isActive = true
        youtubeLinkLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -87).isActive = true
        youtubeLinkLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true

        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: youtubeLinkLabel.bottomAnchor, constant: 42).isActive = true
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

        youtubeLinkLabel.text = "YouTube Link"
        youtubeLinkLabel.textAlignment = .center
        youtubeLinkLabel.font = UIFont(name: "Manrope-Medium", size: 24)
        youtubeLinkLabel.textColor = .titleColors

        textField.placeholder = "Name"

        lineTextFieldLabel.backgroundColor = .systemGray4

        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.systemBlue, for: .normal)
        saveButton.addTarget(self, action: #selector(tapOnSave), for: .touchUpInside)
        saveButton.titleLabel?.font = UIFont(name: "Manrope-Medium", size: 18)
    }

    // MARK: - Actions

    private func configureBindings() {
        viewModel.setYoutubeClosure = { [weak self] youtube in
            self?.textField.text = youtube
        }
    }

    private func getText() -> String? {
        let text = self.textField.text
        return text
    }

    @objc func tapOnSave() {
        guard let youtube = getText(), !youtube.isEmpty else {
            let alert = UIAlertController(title: "Ошибка", message: "Введите ссылку", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }

        if youtube.isValidYouTubeURL() {
            viewModel.setYoutube(youtube: youtube)
            navigationController?.popViewController(animated: true)
        } else {
            let alert = UIAlertController(title: "Ошибка", message: "Проверьте ссылку", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
}


extension String {
    func isValidYouTubeURL() -> Bool {
        let youtubeRegex = #"^(http(s)?:\/\/)?((w){3}.)?youtu(be|.be)?(\.com)?\/.+\""#
        let predicate = NSPredicate(format:"SELF MATCHES %@", youtubeRegex)
        return predicate.evaluate(with: self)
    }
}
