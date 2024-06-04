import UIKit

protocol SettingsViewDelegate: AnyObject {
    func signOutButtonTapped()
    func backButtonTapped()
}

class SettingsView: UIView {

    weak var delegate: SettingsViewDelegate?

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "mood")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Settings"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var backButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(textStyle: .title2)
        button.setImage(UIImage(systemName: "arrow.left", withConfiguration: config), for: .normal)
        button.tintColor = .white
        let action = UIAction { _ in self.delegate?.backButtonTapped() }
        button.addAction(action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var signOutImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        let config = UIImage.SymbolConfiguration(textStyle: .title1)
        imageView.image = UIImage(systemName: "rectangle.portrait.and.arrow.right")?.withConfiguration(config)
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var signOutButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.red, for: .normal)
        button.setTitle("Sign Out", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        let action = UIAction { _ in self.delegate?.signOutButtonTapped() }
        button.addAction(action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    init(delegate: SettingsViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setUpLayouts()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpLayouts() {
        addSubview(backButton)
        addSubview(titleLabel)
        addSubview(signOutImage)
        addSubview(signOutButton)
        insertSubview(imageView, at: 0)

        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),

            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),

            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),

            signOutImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 55),
            signOutImage.trailingAnchor.constraint(equalTo: signOutButton.leadingAnchor, constant: -25),

            signOutButton.centerYAnchor.constraint(equalTo: signOutImage.centerYAnchor),
            signOutButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),

        ])
    }

}
