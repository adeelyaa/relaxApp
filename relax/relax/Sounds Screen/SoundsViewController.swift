import UIKit

class SoundsViewController: UIViewController, SoundsViewDelegate {

    private var soundsView: SoundsView?

    override func viewDidLoad() {
        super.viewDidLoad()

        soundsView = SoundsView(delegate: self)
        view = soundsView

    }

    func beachButtonTapped() {
        let vc = SoundPlayerViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }

    func rainButtonTapped() {
        // TODO: show sound player
    }

    func pianoButtonTapped() {
        // TODO: show sound player
    }

    func birdsButtonTapped() {
        // TODO: show sound player
    }

}
