import UIKit

class MoodTableViewCell: UITableViewCell {

    let emojiLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 50)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "ABeeZee-Regular", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let monthLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "ABeeZee-Regular", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let moodLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "ABeeZee-Regular", size: 21)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let noteLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "ABeeZee-Regular", size: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(emojiLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(monthLabel)
        contentView.addSubview(moodLabel)
        contentView.addSubview(noteLabel)

        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),

            monthLabel.centerXAnchor.constraint(equalTo: dateLabel.centerXAnchor),
            monthLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),

            moodLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 13),
            moodLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            noteLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            noteLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            noteLabel.widthAnchor.constraint(equalToConstant: 126),

            emojiLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            emojiLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with mood: Mood) {
        emojiLabel.text = mood.emoji
        moodLabel.text = mood.mood
        noteLabel.text = mood.note

        let dateFormatter = DateFormatter()
        let dateFormatter2 = DateFormatter()
        dateFormatter.dateFormat = "d"
        dateFormatter2.dateFormat = "MMM"
        dateLabel.text = dateFormatter.string(from: mood.date ?? Date.now)
        monthLabel.text = dateFormatter2.string(from: mood.date ?? Date.now)
    }
}
