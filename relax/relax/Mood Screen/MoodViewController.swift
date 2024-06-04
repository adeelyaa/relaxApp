import UIKit
import CoreData

class MoodViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITextViewDelegate {

    let imageView = UIImageView()
    let collectionView: UICollectionView
    let saveButton = UIButton(type: .system)
    let backButton = UIButton()
    let firstTitle = UILabel()
    let secondTitle = UILabel()
    let moodTextView = UITextView()

    var selectedMood: String?
    var selectedEmoji: String?
    var note: String?
    var currentUser: AppUser?

    let moods = [
            ("happy", "🤩"),
            ("calm", "😌"),
            ("grateful", "🥰"),
            ("sad", "😔"),
            ("anxious", "😖"),
            ("angry", "😤")
        ]

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 90, height: 90)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 40
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        moodTextView.delegate = self

        setUpLayout()
    }

    @objc private func saveButtonTapped() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let mood = Mood(context: context)
        mood.mood = selectedMood
        mood.emoji = selectedEmoji
        mood.note = moodTextView.text
        mood.date = Date()
        mood.user = currentUser

        do {
            try context.save()
        } catch {
            print("Failed to save mood: \(error)")
        }

        NotificationCenter.default.post(name: .moodDidSave, object: nil)

        if let tabBarController = self.presentingViewController as? UITabBarController {
            tabBarController.selectedIndex = 1 
            dismiss(animated: true, completion: nil)
        }
    }

    @objc private func backButtonTapped() {
        dismiss(animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moods.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoodCollectionViewCell.reuseIdentifier, for: indexPath) as! MoodCollectionViewCell
        let mood = moods[indexPath.item]
        cell.emojiLabel.text = mood.1
        cell.titleLabel.text = mood.0
        cell.titleLabel.font = mood.0 == selectedMood ? UIFont(name: "ABeeZee-Regular", size: 23) : UIFont(name: "ABeeZee-Regular", size: 18)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedMood = moods[indexPath.item].0
        selectedEmoji = moods[indexPath.item].1
        collectionView.reloadData()
    }

    func setUpLayout() {
        imageView.image = UIImage(named: "mood")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(imageView, at: 0)

        let config = UIImage.SymbolConfiguration(textStyle: .title2)
        backButton.setImage(UIImage(systemName: "arrow.left", withConfiguration: config), for: .normal)
        backButton.tintColor = .white
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)

        firstTitle.text = "How are you feeling?"
        firstTitle.textColor = .white
        firstTitle.font = UIFont(name: "ABeeZee-Regular", size: 32)
        firstTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(firstTitle)

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(MoodCollectionViewCell.self, forCellWithReuseIdentifier: MoodCollectionViewCell.reuseIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)

        secondTitle.text = "Why are you feeling this way?"
        secondTitle.textColor = .white
        secondTitle.font = UIFont(name: "ABeeZee-Regular", size: 25)
        secondTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(secondTitle)

        moodTextView.font = UIFont.systemFont(ofSize: 20)
        moodTextView.backgroundColor = UIColor.clear
        moodTextView.addWhiteBorder()
        moodTextView.textColor = .white
        moodTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(moodTextView)

        saveButton.setTitle("SAVE", for: .normal)
        saveButton.setTitleColor(.black, for: .normal)
        saveButton.backgroundColor = .white
        saveButton.layer.cornerRadius = 15
        saveButton.layer.masksToBounds = true
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveButton)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),

            firstTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 65),

            collectionView.topAnchor.constraint(equalTo: firstTitle.bottomAnchor, constant: 25),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            collectionView.heightAnchor.constraint(equalToConstant: 260),

            secondTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondTitle.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 40),

            moodTextView.heightAnchor.constraint(equalToConstant: 160),
            moodTextView.widthAnchor.constraint(equalToConstant: 290),
            moodTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            moodTextView.topAnchor.constraint(equalTo: secondTitle.bottomAnchor, constant: 20),

            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 35),
            saveButton.widthAnchor.constraint(equalToConstant: 120),
        ])
    }

}


