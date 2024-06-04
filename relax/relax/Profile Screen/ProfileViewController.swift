import UIKit
import CoreData

class ProfileViewController: UIViewController, ProfileViewDelegate, UITableViewDataSource, UITableViewDelegate {

    private var profileView: ProfileView?

    var recentMoods: [Mood] = []
    var moodTableView = UITableView()
    var currentUser: AppUser?

    override func viewDidLoad() {
        super.viewDidLoad()

        profileView = ProfileView(delegate: self)
        view = profileView

        setUpTableView()

        NotificationCenter.default.addObserver(self, selector: #selector(moodDidSaveNotification(_:)), name: .moodDidSave, object: nil)

        loadRecentMoods()
    }

    func settingsButtonTapped() {
        let vc = SettingsViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }

    func moodButtonTapped() {
        let vc = MoodViewController()
        vc.currentUser = currentUser
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }

    func loadRecentMoods() {
        recentMoods = fetchRecentMoods()
        moodTableView.isHidden = recentMoods.isEmpty
        profileView?.checkMoodLabel.isHidden = recentMoods.isEmpty

        moodTableView.reloadData()
    }

    func loadSaveData()  {

        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        let fetchRequest: NSFetchRequest<Mood> = Mood.fetchRequest()
        do {
            _ = try context.fetch(fetchRequest)
            moodTableView.reloadData()
        } catch {
            print("Could not load save data: \(error.localizedDescription)")
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: .moodDidSave, object: nil)
    }

    func fetchRecentMoods() -> [Mood] {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        guard let currentUser = currentUser else { return [] }

        let fetchRequest: NSFetchRequest<Mood> = Mood.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        fetchRequest.predicate = NSPredicate(format: "user == %@", currentUser)
        do {
            let moods = try context.fetch(fetchRequest)
            return moods
        } catch {
            print("Failed to fetch moods: \(error)")
            return []
        }
    }

    func setUpTableView() {
        moodTableView.dataSource = self
        moodTableView.delegate = self
        moodTableView.register(MoodTableViewCell.self, forCellReuseIdentifier: "MoodCell")
        moodTableView.backgroundColor = .clear
        moodTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(moodTableView)
        NSLayoutConstraint.activate([
            moodTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 344),
            moodTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            moodTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            moodTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
        ])
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoodCell", for: indexPath) as! MoodTableViewCell
        let mood = recentMoods[indexPath.section]

        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 30
        cell.clipsToBounds = true

        cell.configure(with: mood)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let mood = recentMoods[indexPath.section]
        let detailVC = DetailMoodViewController()
        detailVC.mood = mood
        detailVC.modalPresentationStyle = .fullScreen
        present(detailVC, animated: true, completion: nil)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return recentMoods.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let moodItem = recentMoods[indexPath.section]

            context.delete(moodItem)
            do {
                try context.save()
                recentMoods.remove(at: indexPath.section)
                tableView.deleteSections(IndexSet(integer: indexPath.section), with: .automatic)

                loadRecentMoods()
            } catch let error as NSError {
                print("Error while deleting mood: \(error.userInfo)")
            }
        }
    }

    @objc func moodDidSaveNotification(_ notification: Notification) {
        loadRecentMoods()
    }
}

extension Notification.Name {
    static let moodDidSave = Notification.Name("moodDidSave")
}
