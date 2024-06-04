import UIKit

class DetailMoodViewController: UIViewController, DetailMoodViewDelegate {

    var detailMoodView: DetailMoodView?

    var mood: Mood?

    override func viewDidLoad() {
        super.viewDidLoad()

        detailMoodView = DetailMoodView(delegate: self)
        view = detailMoodView

        displayMoodDetails()
    }

    func backButtonTapped() {
        dismiss(animated: true)
    }

    private func displayMoodDetails() {
        guard let mood = mood else { return }
        detailMoodView?.moodLabel.text = mood.mood
        detailMoodView?.emojiLabel.text = mood.emoji
        detailMoodView?.noteLabel.text = mood.note
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM"
        detailMoodView?.dateLabel.text = formatter.string(from: mood.date ?? Date())
    }
}
