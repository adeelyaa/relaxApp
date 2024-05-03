import UIKit

class BreathViewController: UIViewController, BreathViewDelegate {

    private var breathView: BreathView?

    override func viewDidLoad() {
        super.viewDidLoad()

        breathView = BreathView(delegate: self)
        view = breathView

    }

    func firstButtonTapped() {
        // TODO: show breath practice
    }

    func secondButtonTapped() {
        // TODO: show breath practice
    }

    func thirdButtonTapped() {
        // TODO: show breath practice
    }

    func fourthButtonTapped() {
        // TODO: show breath practice
    }

}
