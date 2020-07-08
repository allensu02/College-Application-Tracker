//
//  SubmittedVC.swift
//  College Application Tracker
//
//  Created by Allen Su on 2020/6/12.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import UIKit
import Firebase

class SubmittedVC: CATDataLoadingVC {
    
    var tableView: UITableView!
    var colleges: [SubmittedCollege] = []
    var emptyStateLabel: CATTitleLabel!
    override func viewWillAppear(_ animated: Bool) {
        reloadTable()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Submitted"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Colors.darkBlue, NSAttributedString.Key.font: UIFont(name: "futura", size: 20)!]
        navigationController?.navigationBar.largeTitleTextAttributes =
            [NSAttributedString.Key.foregroundColor: Colors.darkBlue,
             NSAttributedString.Key.font: UIFont(name: "futura", size: 30)]
        configure()
    }
    
    
    func configure () {
        configureTableView()
    }
    
    func configureTableView () {
        tableView = UITableView(frame: view.bounds)
        view.addSubview(tableView)
        tableView.backgroundColor = .systemBackground
        tableView.rowHeight = 140
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CATSubmittedCell.self, forCellReuseIdentifier: CATSubmittedCell.reuseID)
    }
    
    func reloadTable () {
        showLoadingView()
        
        var user: DocumentReference!
        let db = Firestore.firestore()
        if defaults.object(forKey: "uniqueID") != nil {
            user = db.collection("users").document(defaults.object(forKey: "uniqueID") as! String)
        } else {
            user = db.collection("users").document()
            defaults.set(user.documentID, forKey: "uniqueID")
        }
        
        user.collection("submittedColleges").getDocuments { (snapshot, error) in
            if error == nil && snapshot != nil {
                for document in snapshot!.documents {
                    let documentData = document.data()
                    let docID = document["docID"] as! String
                    let name = document["name"] as! String
                    let major = document["major"] as! String
                    let type = document["type"] as! String
                    let submittedDate = document["submitDate"] as! String
                    let tier = document["tier"] as! String
                    
                    let submittedCollege = SubmittedCollege(name: name, major: major, type: type, tier: tier, submittedDate: submittedDate, decisionRelease: "4/3/2021", docID: docID)
                    submittedColleges.append(submittedCollege)
                }
                self.colleges = submittedColleges
                if self.colleges.count == 0 {
                    self.presentEmptyStateView(messageLabel: &self.emptyStateLabel, message: "You haven't submitted any college applications. Get workin! 🥳👏")
                } else {
                    if self.emptyStateLabel != nil {
                        self.emptyStateLabel?.removeFromSuperview()
                        self.emptyStateLabel = nil
                    }
                }
                self.tableView.reloadData()
                submittedColleges.removeAll()
            }
            
        }
        dismissLoadingView()
    }
    
}

extension SubmittedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colleges.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CATSubmittedCell.reuseID, for: indexPath) as! CATSubmittedCell
        cell.clear()
        cell.set(college: colleges[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            let db = Firestore.firestore()
            let user = db.collection("users").document(defaults.object(forKey: "uniqueID") as! String)
            user.collection("submittedColleges").document(self.colleges[indexPath.row].docID).delete()
            self.colleges.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        return [deleteAction]
    }
    
    
}
