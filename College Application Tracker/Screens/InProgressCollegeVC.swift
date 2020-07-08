//
//  InProgressCollegeVC.swift
//  College Application Tracker
//
//  Created by Allen Su on 2020/6/19.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import UIKit
import Firebase

class InProgressCollegeVC: UIViewController {
    
    var submitButton: UIButton!
    var inProgressCollege: InProgressCollege!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        configure()
    }
    
    func configure () {
        configureSubmitButton()
    }
    
    func configureSubmitButton () {
        submitButton = CATButton(backgroundColor: Colors.darkBlue, title: "Submit")
        submitButton.addTarget(self, action: #selector(submitPressed), for: .touchUpInside)
        view.addSubview(submitButton)
        
        NSLayoutConstraint.activate([
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            submitButton.widthAnchor.constraint(equalToConstant: 100),
            submitButton.heightAnchor.constraint(equalToConstant: 30)
            
        ])
    }
    
    @objc func submitPressed () {
        let db = Firestore.firestore()
        let df = DateFormatter()
        df.dateFormat = "MM/dd/yyyy"
        let date = df.string(from: Date())
        let user = db.collection("users").document(defaults.object(forKey: "uniqueID") as! String)
        let newCollege = user.collection("submittedColleges").document()
        newCollege.setData(["docID" : newCollege.documentID, "name": inProgressCollege.collegeName, "major": inProgressCollege.major, "type": inProgressCollege.type, "tier" : inProgressCollege.tier, "submitDate" : date])
        user.collection("inProgressColleges").document(inProgressCollege.docID).delete()
        navigationController?.popViewController(animated: true)
        
    }
    
}
