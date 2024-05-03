import UIKit
import FirebaseAuth

class SignViewController: UIViewController, SignViewDelegate {

    private let signView: SignView
    private let screenType: ScreenType

    init(screenType: ScreenType) {
        self.screenType = screenType
        self.signView = SignView(screenType: screenType)

        super.init(nibName: nil, bundle: nil)

        self.signView.delegate = self

        signView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signView)

        NSLayoutConstraint.activate([
            signView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            signView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            signView.topAnchor.constraint(equalTo: view.topAnchor),
            signView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        signView.backgroundColor = .white
    }

    func signInButtonTapped() {
        guard let email = signView.emailTextField.text, let password = signView.passwordTextField.text else { return }

        if email.isEmpty || password.isEmpty {
            showAlert(message: "Заполните все поля")
        } else {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if error != nil {
                    self.showAlert(message: "Неправильный email или пароль")
                } else {
                    self.showTabBar()
                }
            }
        }
    }

    func signUpButtonTapped() {
        guard let name = signView.nameTextField.text, let email = signView.emailTextField.text, let password = signView.passwordTextField.text else { return }

        if name.isEmpty || email.isEmpty || password.isEmpty {
            showAlert(message: "Заполните все поля")
        } else {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let result = result {
                    let changeRequest = result.user.createProfileChangeRequest()
                    changeRequest.displayName = name
                    changeRequest.commitChanges { _ in
                        self.showTabBar()
                    }
                }
            }
        }
    }

    func signInOptionButtonTapped() {
        let vc = SignViewController(screenType: .signUp)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }

    func signUpOptionButtonTapped() {
        let vc = SignViewController(screenType: .signIn)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    func showTabBar() {
        let tabBarController = UITabBarController()

        let breathViewController = BreathViewController()
        let profileViewController = ProfileViewController()
        let soundsViewController = SoundsViewController()

        breathViewController.tabBarItem = UITabBarItem(title: "Breath", image: UIImage(systemName: "moon"), selectedImage: UIImage(systemName: "moon.fill"))
        profileViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        soundsViewController.tabBarItem = UITabBarItem(title: "Sounds", image: UIImage(systemName: "play"), selectedImage: UIImage(systemName: "play.fill"))

        tabBarController.tabBar.tintColor = .white
        tabBarController.tabBar.unselectedItemTintColor = .white

        tabBarController.viewControllers = [breathViewController, profileViewController, soundsViewController]

        if let window = view.window {
            window.rootViewController = tabBarController
            tabBarController.selectedIndex = 1
        }
    }
    
}