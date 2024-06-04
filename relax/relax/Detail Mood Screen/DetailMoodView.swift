import UIKit

protocol DetailMoodViewDelegate: AnyObject {
    func backButtonTapped()
}

class DetailMoodView: UIView {

    weak var delegate: DetailMoodViewDelegate?

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "mood")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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

    lazy var dateLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "ABeeZee-Regular", size: 22)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var moodLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "ABeeZee-Regular", size: 40)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var emojiLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var emojiAndMoodStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [moodLabel, emojiLabel])
        stackView.axis = .horizontal
        stackView.spacing = 7
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    lazy var noteLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "AbhayaLibre-Regular", size: 24)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init(delegate: DetailMoodViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setUpLayouts()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpLayouts() {
        addSubview(dateLabel)
        addSubview(emojiAndMoodStack)
        addSubview(noteLabel)
        addSubview(backButton)
        insertSubview(imageView, at: 0)

        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),

            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),

            dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dateLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 40),

            emojiAndMoodStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            emojiAndMoodStack.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 70),

            noteLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            noteLabel.widthAnchor.constraint(equalToConstant: 270),
            noteLabel.topAnchor.constraint(equalTo: emojiAndMoodStack.bottomAnchor, constant: 70),
        ])
    }

}
