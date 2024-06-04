import UIKit

class BreathViewController: UIViewController, BreathViewDelegate {

    private var breathView: BreathView?

    override func viewDidLoad() {
        super.viewDidLoad()

        breathView = BreathView(delegate: self)
        view = breathView
    }

    func firstButtonTapped() {
        showBreathPractice(practiceName: "Box Breathing", inhaleDuration: 4, holdAfterInhaleDuration: 4, exhaleDuration: 4, holdAfterExhaleDuration: 4)
    }

    func secondButtonTapped() {
        showBreathPractice(practiceName: "4-6 Breathing", inhaleDuration: 4, holdAfterInhaleDuration: 0, exhaleDuration: 6, holdAfterExhaleDuration: 0)
    }

    func thirdButtonTapped() {
        showBreathPractice(practiceName: "Equal Breathing", inhaleDuration: 4, holdAfterInhaleDuration: 0, exhaleDuration: 4, holdAfterExhaleDuration: 0)
    }

    func fourthButtonTapped() {
        showBreathPractice(practiceName: "4-7-8 Breathing", inhaleDuration: 4, holdAfterInhaleDuration: 7, exhaleDuration: 8, holdAfterExhaleDuration: 0)
    }

    private func showBreathPractice(practiceName: String, inhaleDuration: TimeInterval, holdAfterInhaleDuration: TimeInterval, exhaleDuration: TimeInterval, holdAfterExhaleDuration: TimeInterval) {
        let vc = BreathPracticeViewController()
        vc.practiceName = practiceName
        vc.inhaleDuration = inhaleDuration
        vc.holdAfterInhaleDuration = holdAfterInhaleDuration
        vc.exhaleDuration = exhaleDuration
        vc.holdAfterExhaleDuration = holdAfterExhaleDuration
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }

}
