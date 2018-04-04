//
//  RemindersViewController.swift
//  Habit Monitor
//
//  Created by Whip Master on 3/15/18.
//  Copyright © 2018 NiLabs. All rights reserved.
//

import UIKit

//reminders
var reminders:[String]?

func saveReminderData(reminders:[String]?) {
    UserDefaults.standard.set(reminders, forKey: "reminders")
}

func fetchReminderData() -> [String]? {
    if let reminder = UserDefaults.standard.array(forKey: "reminders") as? [String] {
        return reminder
    } else {
        return nil
    }
}

func deleteReminderData(completedReminder: String) {
    if let index = reminders?.index(of: completedReminder) {
        reminders!.remove(at: index)
    } else {
        print("nothing was deleted")
    }
    UserDefaults.standard.set(reminders, forKey: "reminders")
}

//reminders cell
class RemindersTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var myReminder: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

//reminders controller
class RemindersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: Properties
    @IBOutlet weak var reminderTable: UITableView!
    let cellIdentifier = "RemindersTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        reminderTable.delegate = self
        reminderTable.dataSource = self
        
        reminderTable.tableFooterView = UIView(frame: .zero)
        reminderTable.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: reminderTable.frame.size.width, height: 1))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in reminderTable: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ reminderTable: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminders!.count
    }
    
    func tableView(_ reminderTable: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = reminderTable.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RemindersTableViewCell else {
            fatalError("This cell is not an ReminderTableViewCell")
        }
        cell.myReminder.text = reminders![indexPath.row]
        return cell
    }
    
    func tableView(_ reminderTable: UITableView, didSelectRowAt indexPath: IndexPath) {
        deleteReminderData(completedReminder: String(describing: reminders![indexPath.row]))
        reminderTable.deleteRows(at: [indexPath], with: .right)
    }
    
    @IBAction func composeTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Add Reminder", message: nil, preferredStyle: .alert)
        alert.addTextField { (reminderTF) in
            reminderTF.placeholder = "Enter Reminder"
            reminderTF.borderStyle = .roundedRect
        }
        let action = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let reminder = alert.textFields?.first?.text else { return }
            self.add(reminder: reminder)
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func add(reminder: String) {
        if reminder != "" {
            reminders!.append(reminder)
            UserDefaults.standard.set(reminders, forKey: "reminders")
            reminderTable.insertRows(at: [IndexPath(row: reminders!.count - 1, section: 0)], with: .automatic)
        }
    }
    
}
