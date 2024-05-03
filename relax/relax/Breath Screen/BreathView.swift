import UIKit

protocol BreathViewDelegate: AnyObject {
    func firstButtonTapped()
    func secondButtonTapped()
    func thirdButtonTapped()
    func fourthButtonTapped()
}

class BreathView: UIView {

    weak var delegate: BreathViewDelegate?

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "breath")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Breath practice"
        label.font = UIFont(name: "Alice-Regular", size: 35)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var firstQuoteLabel: UILabel = {
        let label = UILabel()
        label.text = "Breath in deeply to bring"
        label.font = UIFont(name: "AbhayaLibre-Regular", size: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var secondQuoteLabel: UILabel = {
        let label = UILabel()
        label.text = "your mind home to your body"
        label.font = UIFont(name: "AbhayaLibre-Regular", size: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var firstImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "white")
        imageView.layer.cornerRadius = 45
        imageView.layer.masksToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var firstButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Box Breathing", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        let action = UIAction { _ in self.delegate?.firstButtonTapped() }
        button.addAction(action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var firstStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstImageView, firstButton])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var secondImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "white")
        imageView.layer.cornerRadius = 45
        imageView.layer.masksToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var secondButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("4-6 Breathing", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        let action = UIAction { _ in self.delegate?.secondButtonTapped() }
        button.addAction(action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var secondStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [secondImageView, secondButton])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var thirdImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "white")
        imageView.layer.cornerRadius = 45
        imageView.layer.masksToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var thirdButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Equal Breathing", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        let action = UIAction { _ in self.delegate?.thirdButtonTapped() }
        button.addAction(action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var thirdLabel: UILabel = {
        let label = UILabel()
        label.text = "3"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var thirdStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [thirdImageView, thirdButton])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var fourthImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "white")
        imageView.layer.cornerRadius = 45
        imageView.layer.masksToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var fourthButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("4-7-8 Breathing", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        let action = UIAction { _ in self.delegate?.fourthButtonTapped() }
        button.addAction(action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var fourthLabel: UILabel = {
        let label = UILabel()
        label.text = "4"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var fourthStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [fourthImageView, fourthButton])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    init(delegate: BreathViewDelegate) {
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
        addSubview(firstStack)
        addSubview(firstLabel)
        addSubview(secondStack)
        addSubview(secondLabel)
        addSubview(thirdStack)
        addSubview(thirdLabel)
        addSubview(fourthStack)
        addSubview(fourthLabel)
        insertSubview(imageView, at: 0)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 38),

            firstQuoteLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            firstQuoteLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 35),

            secondQuoteLabel.topAnchor.constraint(equalTo: firstQuoteLabel.bottomAnchor, constant: 3),
            secondQuoteLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            firstStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            firstStack.topAnchor.constraint(equalTo: secondQuoteLabel.bottomAnchor, constant: 45),

            firstLabel.centerXAnchor.constraint(equalTo: firstImageView.centerXAnchor),
            firstLabel.centerYAnchor.constraint(equalTo: firstImageView.centerYAnchor),

            secondStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            secondStack.topAnchor.constraint(equalTo: firstStack.bottomAnchor, constant: 25),

            secondLabel.centerXAnchor.constraint(equalTo: secondImageView.centerXAnchor),
            secondLabel.centerYAnchor.constraint(equalTo: secondImageView.centerYAnchor),

            thirdStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            thirdStack.topAnchor.constraint(equalTo: secondStack.bottomAnchor, constant: 25),

            thirdLabel.centerXAnchor.constraint(equalTo: thirdImageView.centerXAnchor),
            thirdLabel.centerYAnchor.constraint(equalTo: thirdImageView.centerYAnchor),

            fourthStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            fourthStack.topAnchor.constraint(equalTo: thirdStack.bottomAnchor, constant: 25),

            fourthLabel.centerXAnchor.constraint(equalTo: fourthImageView.centerXAnchor),
            fourthLabel.centerYAnchor.constraint(equalTo: fourthImageView.centerYAnchor),

            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
