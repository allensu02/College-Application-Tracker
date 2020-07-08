//
//  AddCollegeVC.swift
//  College Application Tracker
//
//  Created by Allen Su on 2020/6/13.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import UIKit
import Firebase

class AddCollegeVC: UIViewController {

    var newView: CATNewCollegeView!
    var user: DocumentReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .automatic

        view.backgroundColor = .systemBackground
        navigationItem.title = "Add New College"
        configureView()
        let db = Firestore.firestore()
        if defaults.object(forKey: "uniqueID") != nil {
            user = db.collection("users").document(defaults.object(forKey: "uniqueID") as! String)
        } else {
            user = db.collection("users").document()
            defaults.set(user.documentID, forKey: "uniqueID")
        }
    }
 
    func configureView () {
        newView = CATNewCollegeView()
        view.addSubview(newView)
        
        newView.frame = view.bounds
        newView.addCollegeButton.addTarget(self, action: #selector(addCollegePressed), for: .touchUpInside)
    }
    
    @objc func addCollegePressed () {
        guard let name = newView.universityNameTextfield.text, name != "",
            let major = newView.majorTextfield.text, major != "",
            let deadline = newView.deadlineTextfield.text, deadline != "",
            let type = newView.typeTextfield.text, type != "",
            let priority = newView.priorityTextfield.text, priority != "",
            let tier = newView.tierTextfield.text, tier != ""
            
            else {
                presentCATAlertOnMainThread(title: "Unfilled Information", message: "Please Fill Out All The Information.", buttonTitle: "Ok")
                return
        }
        let newCollege = user.collection("inProgressColleges").document()
        newCollege.setData(["docID" : newCollege.documentID, "name": name, "major": major, "deadline" : deadline, "type": type, "tier" : tier, "priority" : priority])
        navigationController?.popViewController(animated: true)
    }
    
}
