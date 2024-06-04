import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController, SettingsViewDelegate {

    private var settingsView: SettingsView?

    override func viewDidLoad() {
        super.viewDidLoad()

        settingsView = SettingsView(delegate: self)
        view = settingsView
    }

    func signOutButtonTapped() {
        do {
            try Auth.auth().signOut()
            let vc = StartViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        } catch let err {
                print(err)
        }
    }

    func backButtonTapped() {
        dismiss(animated: true)
    }

}
