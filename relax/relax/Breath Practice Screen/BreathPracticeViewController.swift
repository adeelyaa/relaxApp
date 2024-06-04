import UIKit

class BreathPracticeViewController: UIViewController, BreathPracticeViewDelegate {

    var breathPracticeView: BreathPracticeView?

    var practiceName: String?
    var inhaleDuration: TimeInterval = 4.0
    var holdAfterInhaleDuration: TimeInterval = 4.0
    var exhaleDuration: TimeInterval = 4.0
    var holdAfterExhaleDuration: TimeInterval = 4.0

    private var animator: UIViewPropertyAnimator?
    private var timer: Timer?
    private var countdownTimer: Timer?
    private var isPracticing = false
    private let animationDuration: TimeInterval = 4.0
    private var currentPhase: Phase = .inhale
    private var remainingSeconds: Int = 300

    private enum Phase {
        case inhale, holdAfterInhale, exhale, holdAfterExhale
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        breathPracticeView = BreathPracticeView(delegate: self)
        view = breathPracticeView

        breathPracticeView?.timeLabel.text = formatTime(seconds: remainingSeconds)
        breathPracticeView?.practiceName.text = practiceName
    }

    func backButtonTapped() {
        dismiss(animated: true)
    }

    func startPracticeButtonTapped() {
        isPracticing.toggle()

        if isPracticing {
            startCountdown()
            continueBreathingPractice()
            breathPracticeView?.updateStartButton(isPlaying: true)
        } else {
            stopBreathingPractice()
            breathPracticeView?.updateStartButton(isPlaying: false)
        }
    }

    private func startCountdown() {
        countdownTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.updateTime()
        }
    }

    private func stopCountdown() {
        countdownTimer?.invalidate()
    }

    private func updateTime() {
        remainingSeconds -= 1
        breathPracticeView?.timeLabel.text = formatTime(seconds: remainingSeconds)

        if remainingSeconds <= 0 {
            stopBreathingPractice()
            breathPracticeView?.timeLabel.text = formatTime(seconds: 300) 
            remainingSeconds = 300
            breathPracticeView?.updateStartButton(isPlaying: false)
        }
    }

    private func formatTime(seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    private func continueBreathingPractice() {
        switch currentPhase {
        case .inhale:
            breathPracticeView?.inhaleOrExhaleLabel.text = "inhale"
            animateCircle(duration: inhaleDuration, scale: 2.0) {
                self.currentPhase = .holdAfterInhale
                self.holdBreathAfterInhale()
            }
        case .holdAfterInhale:
            holdBreathAfterInhale()
        case .exhale:
            breathPracticeView?.inhaleOrExhaleLabel.text = "exhale"
            animateCircle(duration: exhaleDuration, scale: 1.0) {
                if self.holdAfterExhaleDuration > 0 {
                    self.currentPhase = .holdAfterExhale
                } else {
                    self.currentPhase = .inhale
                }
                self.continueBreathingPractice()
            }
        case .holdAfterExhale:
            holdBreathAfterExhale()
        }
    }

    private func stopBreathingPractice() {
        animator?.stopAnimation(true)
        timer?.invalidate()
        stopCountdown()
    }

    private func animateCircle(duration: TimeInterval, scale: CGFloat, completion: @escaping () -> Void) {
        animator = UIViewPropertyAnimator(duration: duration, curve: .easeInOut) {
            self.breathPracticeView?.circleImageView.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
        animator?.addCompletion { _ in
            completion()
        }
        animator?.startAnimation()
    }

    private func exhaleBreath() {
        breathPracticeView?.inhaleOrExhaleLabel.text = "exhale"
        animateCircle(duration: exhaleDuration, scale: 1.0) {
            self.currentPhase = .holdAfterExhale
            self.holdBreathAfterExhale()
        }
    }

    private func holdBreathAfterInhale() {
        breathPracticeView?.inhaleOrExhaleLabel.text = "hold"
        timer = Timer.scheduledTimer(withTimeInterval: holdAfterInhaleDuration, repeats: false) { _ in
            self.currentPhase = .exhale
            self.continueBreathingPractice()
        }
    }

    private func holdBreathAfterExhale() {
        breathPracticeView?.inhaleOrExhaleLabel.text = "hold"
        timer = Timer.scheduledTimer(withTimeInterval: holdAfterExhaleDuration, repeats: false) { _ in
            self.currentPhase = .inhale
            self.continueBreathingPractice()
        }
    }

}
