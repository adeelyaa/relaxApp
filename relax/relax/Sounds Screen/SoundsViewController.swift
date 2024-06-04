import UIKit

class SoundsViewController: UIViewController, SoundsViewDelegate {

    private var soundsView: SoundsView?

    override func viewDidLoad() {
        super.viewDidLoad()

        soundsView = SoundsView(delegate: self)
        view = soundsView

    }

    func beachButtonTapped() {
        showSoundPlayer(image: UIImage(named: "beach"), soundFileName: "beach", soundName: "Beach")
    }

    func rainButtonTapped() {
        showSoundPlayer(image: UIImage(named: "rain"), soundFileName: "rain", soundName: "Rain")
    }

    func pianoButtonTapped() {
        showSoundPlayer(image: UIImage(named: "piano"), soundFileName: "piaano", soundName: "Piano")
    }

    func birdsButtonTapped() {
        showSoundPlayer(image: UIImage(named: "birds"), soundFileName: "birds", soundName: "Birds")
    }

    private func showSoundPlayer(image: UIImage?, soundFileName: String, soundName: String) {
        let vc = SoundPlayerViewController()
        vc.selectedImage = image
        vc.soundFileName = soundFileName
        vc.soundName = soundName
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }

}
