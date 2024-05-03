import UIKit

class ProfileViewController: UIViewController, ProfileViewDelegate {

    private var profileView: ProfileView?

    override func viewDidLoad() {
        super.viewDidLoad()

        profileView = ProfileView(delegate: self)
        view = profileView
    }

}
