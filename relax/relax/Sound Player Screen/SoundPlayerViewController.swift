import UIKit
import AVFoundation

class SoundPlayerViewController: UIViewController, SoundPlayerViewDelegate {

    var soundPlayerView: SoundPlayerView?

    var soundFileName: String?
    var selectedImage: UIImage?
    var soundName: String?
    private var player: AVAudioPlayer?
    private var timer: Timer?
    private var updater: CADisplayLink?


    override func viewDidLoad() {
        super.viewDidLoad()

        soundPlayerView = SoundPlayerView(delegate: self)
        view = soundPlayerView

        soundPlayerView?.soundImageView.image = selectedImage
        soundPlayerView?.soundName.text = soundName
    }

    func backButtonTapped() {
        stopAudio()
        dismiss(animated: true)
    }

    func playButtonTapped() {
        if player != nil && player!.isPlaying {
            player?.pause()
            timer?.invalidate()
            updater?.invalidate()
            let config = UIImage.SymbolConfiguration(textStyle: .largeTitle)
            soundPlayerView?.playButton.setImage(UIImage(systemName: "play")?.withConfiguration(config), for: .normal)
        } else {
            guard let path = Bundle.main.path(forResource: soundFileName, ofType: "mp3") else {
                return
            }
            let url = URL(fileURLWithPath: path)
            do {
                if player == nil {
                    player = try AVAudioPlayer(contentsOf: url)
                    player?.delegate = self
                }
                player?.play()
                startTimer()
                startUpdater()
                let config = UIImage.SymbolConfiguration(textStyle: .largeTitle)
                soundPlayerView?.playButton.setImage(UIImage(systemName: "pause")?.withConfiguration(config), for: .normal)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }

    func rewindButtonTapped() {
        guard let player = player else { return }
        player.currentTime = max(0, player.currentTime - 15)
        updateTimerLabel()
        updateProgressView()
    }

    func forwardButtonTapped() {
        guard let player = player else { return }
        player.currentTime = min(player.duration, player.currentTime + 15)
        updateTimerLabel()
        updateProgressView()
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimerLabel), userInfo: nil, repeats: true)
    }

    @objc private func updateTimerLabel() {
        guard let player = player else { return }
        let minutes = Int(player.currentTime / 60)
        let seconds = Int(player.currentTime.truncatingRemainder(dividingBy: 60))
        soundPlayerView?.timeLabel.text = String(format: "%02d:%02d", minutes, seconds)
    }

    private func startUpdater() {
        updater = CADisplayLink(target: self, selector: #selector(updateProgressView))
        updater?.add(to: .current, forMode: .common)
    }

    @objc private func updateProgressView() {
        guard let player = player else { return }
        let progress = Float(player.currentTime / player.duration)
        soundPlayerView?.soundProgress.progress = progress
    }
    private func stopAudio() {
        player?.stop()
        player = nil
        timer?.invalidate()
        updater?.invalidate()
        soundPlayerView?.timeLabel.text = "00:00"
        soundPlayerView?.soundProgress.progress = 0.0
        let config = UIImage.SymbolConfiguration(textStyle: .largeTitle)
        soundPlayerView?.playButton.setImage(UIImage(systemName: "play")?.withConfiguration(config), for: .normal)
    }
}

extension SoundPlayerViewController: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        stopAudio()
    }
}
