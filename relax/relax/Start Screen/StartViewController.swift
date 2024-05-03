import UIKit

class StartViewController: UIViewController, StartViewDelegate {

    private var startView: StartView?

    override func viewDidLoad() {
        super.viewDidLoad()

        startView = StartView(delegate: self)
        view = startView

    }

    func signInButtonTapped() {
        let vc = SignViewController(screenType: .signIn)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }

    func signUpButtonTapped() {
        let vc = SignViewController(screenType: .signUp)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }

}
