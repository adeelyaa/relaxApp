import UIKit
import FirebaseAuth

protocol ProfileViewDelegate: AnyObject {
    func settingsButtonTapped()
    func moodButtonTapped()
}

class ProfileView: UIView {

    weak var delegate: ProfileViewDelegate?

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "profile")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hi \(Auth.auth().currentUser?.displayName ?? "friend"),"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "today is a good day!"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var settingsButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(textStyle: .title1)
        button.setImage(UIImage(systemName: "gearshape")?.withConfiguration(config), for: .normal)
        button.tintColor = .white
        let action = UIAction { _ in self.delegate?.settingsButtonTapped() }
        button.addAction(action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var moodButton: UIButton = {
        var configuration = UIButton.Configuration.bordered()
        configuration.titleAlignment = .leading
        configuration.baseBackgroundColor = .white
        configuration.baseForegroundColor = .black
        configuration.image = UIImage(systemName: "hand.tap", withConfiguration: UIImage.SymbolConfiguration(textStyle: .title1))?.withTintColor(.black, renderingMode: .alwaysOriginal)
        configuration.imagePlacement = .trailing
        configuration.imagePadding = 70
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 0)
        let button = UIButton(configuration: configuration)
        button.contentHorizontalAlignment = .left
        button.setTitle("take a minute to add\nyour current mood", for: .normal)
        button.titleLabel?.font = UIFont(name: "ABeeZee-Regular", size: 25)
        button.setTitleColor(.black, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 83).isActive = true
        button.widthAnchor.constraint(equalToConstant: 325).isActive = true
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.lineBreakMode = .byWordWrapping
        let action = UIAction { _ in self.delegate?.moodButtonTapped() }
        button.addAction(action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var checkMoodLabel: UILabel = {
        var label = UILabel()
        label.text = "Check your last moods:"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init(delegate: ProfileViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setUpLayouts()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpLayouts() {
        addSubview(nameLabel)
        addSubview(titleLabel)
        addSubview(settingsButton)
        addSubview(moodButton)
        addSubview(checkMoodLabel)
        insertSubview(imageView, at: 0)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),

            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

            titleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

            settingsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -37),
            settingsButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 57),

            moodButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 33),
            moodButton.centerXAnchor.constraint(equalTo: centerXAnchor),

            checkMoodLabel.topAnchor.constraint(equalTo: moodButton.bottomAnchor, constant: 75),
            checkMoodLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
        ])
    }

}
