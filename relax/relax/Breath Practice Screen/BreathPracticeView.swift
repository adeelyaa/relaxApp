import UIKit

protocol BreathPracticeViewDelegate: AnyObject {
    func backButtonTapped()
    func startPracticeButtonTapped()
}

class BreathPracticeView: UIView {

    weak var delegate: BreathPracticeViewDelegate?

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "breath")
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

    lazy var practiceName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "ABeeZee-Regular", size: 30)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var circleImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "glitter")
        imageView.layer.borderWidth = 1
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.cornerRadius = 70
        imageView.clipsToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 140).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var inhaleOrExhaleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "ABeeZee-Regular", size: 30)
        label.text = "inhale"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "ABeeZee-Regular", size: 23)
        label.textColor = UIColor(red: 1/255, green: 1/255, blue: 152/255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var startPracticeButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 52)
        button.setImage(UIImage(systemName: "play.circle")?.withConfiguration(config), for: .normal)
        button.tintColor = .white
        let action = UIAction { _ in self.delegate?.startPracticeButtonTapped() }
        button.addAction(action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    init(delegate: BreathPracticeViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setUpLayouts()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpLayouts() {
        addSubview(backButton)
        addSubview(practiceName)
        addSubview(circleImageView)
        addSubview(inhaleOrExhaleLabel)
        addSubview(timeLabel)
        addSubview(startPracticeButton)
        insertSubview(imageView, at: 0)

        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),

            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),

            practiceName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 70),
            practiceName.centerXAnchor.constraint(equalTo: centerXAnchor),

            circleImageView.topAnchor.constraint(equalTo: practiceName.bottomAnchor, constant: 120),
            circleImageView.centerXAnchor.constraint(equalTo: centerXAnchor),

            inhaleOrExhaleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            inhaleOrExhaleLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -250),

            timeLabel.bottomAnchor.constraint(equalTo: startPracticeButton.topAnchor, constant: -37),
            timeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            startPracticeButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            startPracticeButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -18),
        ])
    }

    func updateStartButton(isPlaying: Bool) {
        let config = UIImage.SymbolConfiguration(pointSize: 52)
        let imageName = isPlaying ? "pause.circle" : "play.circle"
        startPracticeButton.setImage(UIImage(systemName: imageName)?.withConfiguration(config), for: .normal)
    }

}
