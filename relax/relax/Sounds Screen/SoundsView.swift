import UIKit

protocol SoundsViewDelegate: AnyObject {
    func beachButtonTapped()
    func rainButtonTapped()
    func pianoButtonTapped()
    func birdsButtonTapped()
}

class SoundsView: UIView {

    weak var delegate: SoundsViewDelegate?

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "sounds")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Relaxing sounds"
        label.font = UIFont(name: "Alice-Regular", size: 35)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var firstQuoteLabel: UILabel = {
        let label = UILabel()
        label.text = "Sometimes the most productive"
        label.font = UIFont(name: "AbhayaLibre-Regular", size: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var secondQuoteLabel: UILabel = {
        let label = UILabel()
        label.text = "thing you can do is relax"
        label.font = UIFont(name: "AbhayaLibre-Regular", size: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var beachImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "beach")
        imageView.layer.cornerRadius = 18
        imageView.layer.masksToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var beachButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Beach", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        let action = UIAction { _ in self.delegate?.beachButtonTapped() }
        button.addAction(action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var beachLabel: UILabel = {
        let label = UILabel()
        label.text = "10 min"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var beachStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [beachImageView, beachButton, beachLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.setCustomSpacing(80, after: beachButton)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var rainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "rain")
        imageView.layer.cornerRadius = 18
        imageView.layer.masksToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var rainButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Rain", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        let action = UIAction { _ in self.delegate?.rainButtonTapped() }
        button.addAction(action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var rainLabel: UILabel = {
        let label = UILabel()
        label.text = "10 min"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var rainStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [rainImageView, rainButton, rainLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 22
        stackView.setCustomSpacing(95, after: rainButton)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var pianoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "piano")
        imageView.layer.cornerRadius = 18
        imageView.layer.masksToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var pianoButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Piano", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        let action = UIAction { _ in self.delegate?.pianoButtonTapped() }
        button.addAction(action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var pianoLabel: UILabel = {
        let label = UILabel()
        label.text = "10 min"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var pianoStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [pianoImageView, pianoButton, pianoLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 21
        stackView.setCustomSpacing(85, after: pianoButton)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var birdsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "birds")
        imageView.layer.cornerRadius = 18
        imageView.layer.masksToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var birdsButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Birds", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        let action = UIAction { _ in self.delegate?.birdsButtonTapped() }
        button.addAction(action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var birdsLabel: UILabel = {
        let label = UILabel()
        label.text = "10 min"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var birdsStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [birdsImageView, birdsButton, birdsLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 21
        stackView.setCustomSpacing(88, after: birdsButton)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    init(delegate: SoundsViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setUpLayouts()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpLayouts() {
        addSubview(titleLabel)
        addSubview(firstQuoteLabel)
        addSubview(secondQuoteLabel)
        addSubview(beachStack)
        addSubview(rainStack)
        addSubview(pianoStack)
        addSubview(birdsStack)
        insertSubview(imageView, at: 0)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 45),

            firstQuoteLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            firstQuoteLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),

            secondQuoteLabel.topAnchor.constraint(equalTo: firstQuoteLabel.bottomAnchor, constant: 3),
            secondQuoteLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            beachStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            beachStack.topAnchor.constraint(equalTo: secondQuoteLabel.bottomAnchor, constant: 50),

            rainStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            rainStack.topAnchor.constraint(equalTo: beachStack.bottomAnchor, constant: 35),

            pianoStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            pianoStack.topAnchor.constraint(equalTo: rainStack.bottomAnchor, constant: 35),

            birdsStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            birdsStack.topAnchor.constraint(equalTo: pianoStack.bottomAnchor, constant: 35),

            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
