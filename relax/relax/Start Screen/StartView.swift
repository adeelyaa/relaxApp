import UIKit

protocol StartViewDelegate: AnyObject {
    func signInButtonTapped()
    func signUpButtonTapped()
}

class StartView: UIView {

    weak var delegate: StartViewDelegate?

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "start")
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var relaxLabel: UILabel = {
        let label = UILabel()
        label.text = "RELAX"
        label.font = UIFont(name: "Kavivanar-Regular", size: 43)
        label.textColor = .white
        label.textDropShadow()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var firstQuoteLabel: UILabel = {
        let label = UILabel()
        label.text = "Quiet the mind"
        label.font = UIFont(name: "AbhayaLibre-Regular", size: 31)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var secondQuoteLabel: UILabel = {
        let label = UILabel()
        label.text = "and the soul will speak"
        label.font = UIFont(name: "AbhayaLibre-Regular", size: 31)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 43/255, green: 39/255, blue: 193/255, alpha: 1)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.setTitle("sign in", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        let action = UIAction { _ in self.delegate?.signInButtonTapped() }
        button.addAction(action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Don't have an account?"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor(red: 43/255, green: 39/255, blue: 193/255, alpha: 1), for: .normal)
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        let action = UIAction { _ in self.delegate?.signUpButtonTapped() }
        button.addAction(action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    init(delegate: StartViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setUpLayouts()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpLayouts() {
        addSubview(relaxLabel)
        addSubview(firstQuoteLabel)
        addSubview(secondQuoteLabel)
        addSubview(signInButton)
        addSubview(signUpLabel)
        addSubview(signUpButton)
        insertSubview(imageView, at: 0)

        NSLayoutConstraint.activate([
            relaxLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            relaxLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 185),

            firstQuoteLabel.topAnchor.constraint(equalTo: relaxLabel.bottomAnchor, constant: 35),
            firstQuoteLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            secondQuoteLabel.topAnchor.constraint(equalTo: firstQuoteLabel.bottomAnchor, constant: 1),
            secondQuoteLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            signInButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -80),
            signInButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            signInButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            signInButton.heightAnchor.constraint(equalToConstant: 53),

            signUpLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 6),
            signUpLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 65),

            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor),
            signUpButton.leadingAnchor.constraint(equalTo: signUpLabel.trailingAnchor, constant: 5),

            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}

