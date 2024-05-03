import UIKit

class SoundPlayerViewController: UIViewController, SoundPlayerViewDelegate {

    private var soundPlayerView: SoundPlayerView?

    override func viewDidLoad() {
        super.viewDidLoad()

        soundPlayerView = SoundPlayerView(delegate: self)
        view = soundPlayerView

    }

    func backButtonTapped() {
        dismiss(animated: true)
    }

}
