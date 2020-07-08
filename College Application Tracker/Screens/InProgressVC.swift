//
//  InProgressVC.swift
//  College Application Tracker
//
//  Created by Allen Su on 2020/6/12.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import UIKit
import Firebase

class InProgressVC: CATDataLoadingVC {
    
    var tableView: UITableView!
    var college: InProgressCollege!
    var colleges: [InProgressCollege] = []
    var sortLabel: CATSecondaryTitleLabel!
    var emptyStateLabel: CATTitleLabel?

    var user: DocumentReference!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        reloadTable()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        navigationItem.title = "In Progress"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Colors.darkBlue, NSAttributedString.Key.font: UIFont(name: "futura", size: 20)!]
        navigationController?.navigationBar.largeTitleTextAttributes =
            [NSAttributedString.Key.foregroundColor: Colors.darkBlue,
             NSAttributedString.Key.font: UIFont(name: "futura", size: 30)]
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTouched))
        
    }
    
    func reloadTable () {
        
        var user: DocumentReference!
        let db = Firestore.firestore()
        if defaults.object(forKey: "uniqueID") != nil {
            user = db.collection("users").document(defaults.object(forKey: "uniqueID") as! String)
        } else {
            user = db.collection("users").document()
            defaults.set(user.documentID, forKey: "uniqueID")
        }
        
        user.collection("inProgressColleges").getDocuments { (snapshot, error) in
            if error == nil && snapshot != nil {
                for document in snapshot!.documents {
                    let documentData = document.data()
                    let docID = document["docID"] as! String
                    let name = document["name"] as! String
                    let major = document["major"] as! String
                    let type = document["type"] as! String
                    let deadline = document["deadline"] as! String
                    let priority = document["priority"] as! String
                    let tier = document["tier"] as! String
                    
                    let newInProgressCollege = InProgressCollege(name: name, major: major, type: type, tier: tier, deadline: deadline, priority: priority, docID: docID)
                    inProgressColleges.append(newInProgressCollege)
                }
                self.colleges = []
                self.colleges = inProgressColleges
                if self.colleges.count == 0 {
                    self.presentEmptyStateView(messageLabel: &self.emptyStateLabel, message: "You have no college applications. Add a new college! 😊👌")
                } else {
                    if self.emptyStateLabel != nil {
                        self.emptyStateLabel?.removeFromSuperview()
                        self.emptyStateLabel = nil
                    }
                }
                self.tableView.reloadData()
                
                inProgressColleges.removeAll()
            }
        }
        
        
    }
    
    
    @objc func addButtonTouched () {
        let addCollegeVC = AddCollegeVC(nibName: nil, bundle: nil)
        navigationController?.pushViewController(addCollegeVC, animated: true)
    }
    

    func configureTableView () {
        tableView = UITableView(frame: view.bounds)
        view.addSubview(tableView)
        tableView.rowHeight = 140
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CATProgressCell.self, forCellReuseIdentifier: CATProgressCell.reuseID)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension InProgressVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("count: \(colleges.count)")
        return colleges.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CATProgressCell.reuseID, for: indexPath) as! CATProgressCell
        cell.clear()
        cell.set(college: colleges[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let inProgressCollegeVC = InProgressCollegeVC()
        inProgressCollegeVC.inProgressCollege = colleges[indexPath.row]
        navigationController?.pushViewController(inProgressCollegeVC, animated: true)
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            let db = Firestore.firestore()
            let user = db.collection("users").document(defaults.object(forKey: "uniqueID") as! String)
            user.collection("inProgressColleges").document(self.colleges[indexPath.row].docID).delete()
            self.colleges.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            self.reloadTable()
        }
        
        
        return [deleteAction]
    }
    
}
