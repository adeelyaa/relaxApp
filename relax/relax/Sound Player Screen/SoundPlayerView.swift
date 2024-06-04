import UIKit
import AVFoundation

protocol SoundPlayerViewDelegate: AnyObject {
    func backButtonTapped()
    func playButtonTapped()
    func rewindButtonTapped()
    func forwardButtonTapped()
}

class SoundPlayerView: UIView {

    weak var delegate: SoundPlayerViewDelegate?

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "sounds")
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

    lazy var soundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 140
        imageView.layer.masksToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 280).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 280).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var soundName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Bellota-Regular", size: 35)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var playButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(textStyle: .largeTitle)
        button.setImage(UIImage(systemName: "play")?.withConfiguration(config), for: .normal)
        button.tintColor = .white
        let action = UIAction { _ in self.delegate?.playButtonTapped() }
        button.addAction(action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "ABee-Zee-Regular", size: 15)
        label.textColor = .white
        label.text = "00:00"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var fullTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "ABee-Zee-Regular", size: 15)
        label.textColor = .white
        label.text = "10:00"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var forwardButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(textStyle: .largeTitle)
        button.setImage(UIImage(systemName: "goforward.15")?.withConfiguration(config), for: .normal)
        button.tintColor = .white
        let action = UIAction { _ in self.delegate?.forwardButtonTapped() }
        button.addAction(action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var rewindButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(textStyle: .largeTitle)
        button.setImage(UIImage(systemName: "gobackward.15")?.withConfiguration(config), for: .normal)
        button.tintColor = .white
        let action = UIAction { _ in self.delegate?.rewindButtonTapped() }
        button.addAction(action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var buttonStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [rewindButton, playButton, forwardButton])
        stackView.axis = .horizontal
        stackView.spacing = 60
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    lazy var soundProgress: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .default)
        progress.trackTintColor = UIColor(red: 0/255, green: 40/255, blue: 109/255, alpha: 0.6)
        progress.progressTintColor = .white
        progress.progress = 0.0
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()

    init(delegate: SoundPlayerViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setUpLayouts()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setSoundImage(_ image: UIImage?) {
        soundImageView.image = image
    }

    func setUpLayouts() {
        addSubview(backButton)
        addSubview(soundImageView)
        addSubview(soundName)
        addSubview(timeLabel)
        addSubview(fullTimeLabel)
        addSubview(soundProgress)
        addSubview(buttonStack)
        insertSubview(imageView, at: 0)

        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),

            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),

            soundImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            soundImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 90),

            soundName.topAnchor.constraint(equalTo: soundImageView.bottomAnchor, constant: 20),
            soundName.centerXAnchor.constraint(equalTo: centerXAnchor),

            timeLabel.leadingAnchor.constraint(equalTo: soundProgress.leadingAnchor),
            timeLabel.bottomAnchor.constraint(equalTo: soundProgress.topAnchor, constant: -25),

            fullTimeLabel.trailingAnchor.constraint(equalTo: soundProgress.trailingAnchor),
            fullTimeLabel.bottomAnchor.constraint(equalTo: soundProgress.topAnchor, constant: -25),

            soundProgress.bottomAnchor.constraint(equalTo: buttonStack.topAnchor, constant: -50),
            soundProgress.widthAnchor.constraint(equalToConstant: 300),
            soundProgress.centerXAnchor.constraint(equalTo: centerXAnchor),

            buttonStack.topAnchor.constraint(equalTo: soundName.bottomAnchor, constant: 190), //140
            buttonStack.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

}
