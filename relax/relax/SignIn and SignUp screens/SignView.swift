import UIKit
import SwiftUI

enum ScreenType {
    case signIn
    case signUp
}

protocol SignViewDelegate: AnyObject {
    func signInButtonTapped()
    func signUpButtonTapped()
    func signInOptionButtonTapped()
    func signUpOptionButtonTapped()
}

class SignView: UIView {

    weak var delegate: SignViewDelegate?
    let screenType: ScreenType

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Amiko-Regular", size: 30)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .white
        textField.font = UIFont.systemFont(ofSize: 23)
        textField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont(name: "AbhayaLibre-Regular", size: 25)!])
        textField.backgroundColor = UIColor.clear
        textField.borderStyle = .none
        textField.addBottomLine(color: .white, height: 2.0)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .white
        textField.font = UIFont.systemFont(ofSize: 23)
        textField.attributedPlaceholder = NSAttributedString(string: "Email Address", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont(name: "AbhayaLibre-Regular", size: 25)!])
        textField.backgroundColor = UIColor.clear
        textField.borderStyle = .none
        textField.addBottomLine(color: .white, height: 2.0)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .white
        textField.font = UIFont.systemFont(ofSize: 23)
        textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont(name: "AbhayaLibre-Regular", size: 25)!])
        textField.backgroundColor = UIColor.clear
        textField.borderStyle = .none
        textField.isSecureTextEntry = true
        textField.addBottomLine(color: .white, height: 2.0)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var textFieldStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameTextField, emailTextField, passwordTextField])
        stackView.axis = .vertical
        stackView.spacing = 35
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var signButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 43/255, green: 39/255, blue: 193/255, alpha: 1)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var anotherOptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = UIColor(red: 43/255, green: 39/255, blue: 193/255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var anotherOptionButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.addTarget(self, action: #selector(optionButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var anotherOptionStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [anotherOptionLabel, anotherOptionButton])
        stackView.axis = .horizontal
        stackView.spacing = 7
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    init(screenType: ScreenType) {
        self.screenType = screenType

        super.init(frame: .zero)

        setUpLayouts(screenType: screenType)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func actionButtonTapped() {
        if screenType == .signIn {
            self.delegate?.signInButtonTapped()
        } else {
            self.delegate?.signUpButtonTapped()
        }
    }

    @objc func optionButtonTapped() {
        if screenType == .signIn {
            self.delegate?.signInOptionButtonTapped()
        } else {
            self.delegate?.signUpOptionButtonTapped()
        }
    }

    private func setUpLayouts(screenType: ScreenType) {

        titleLabel.text = screenType == .signIn ? "Sign In" : "Sign Up"
        imageView.image = screenType == .signIn ? UIImage(named: "sign") : UIImage(named: "sign2")
        signButton.setTitle(screenType == .signIn ? "SIGN IN" : "SIGN UP", for: .normal)
        anotherOptionLabel.text = screenType == .signIn ? "Don't have an account?" : "Already have an account?"
        anotherOptionButton.setTitle(screenType == .signIn ? "Sign Up" : "Sign In", for: .normal)

        if screenType == .signIn {
            nameTextField.isHidden = true
        }

        addSubview(titleLabel)
        addSubview(textFieldStack)
        addSubview(signButton)
        addSubview(anotherOptionLabel)
        addSubview(anotherOptionButton)
        addSubview(anotherOptionStack)
        insertSubview(imageView, at: 0)

        NSLayoutConstraint.activate([

            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            textFieldStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 80),
            textFieldStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            textFieldStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),

            signButton.topAnchor.constraint(equalTo: textFieldStack.bottomAnchor, constant: 80),
            signButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            signButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            signButton.heightAnchor.constraint(equalToConstant: 55),

            anotherOptionLabel.topAnchor.constraint(equalTo: signButton.bottomAnchor, constant: 10),

            anotherOptionButton.topAnchor.constraint(equalTo: signButton.bottomAnchor, constant: 10),

            anotherOptionStack.centerXAnchor.constraint(equalTo: signButton.centerXAnchor),

            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}



