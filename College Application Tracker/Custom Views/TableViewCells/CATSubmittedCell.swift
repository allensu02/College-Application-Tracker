//
//  CATSubmittedCell.swift
//  College Application Tracker
//
//  Created by Allen Su on 2020/6/20.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import UIKit

class CATSubmittedCell: UITableViewCell {
    
    var college: SubmittedCollege!
    var containerView: CATSubmittedCellView!
    
    static let reuseID = "submittedCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(college: SubmittedCollege) {
        self.college = college
        configure()
    }
    
    func configure () {
        containerView = CATSubmittedCellView(college: college)
        addSubview(containerView)
        selectionStyle = .none
        let padding: CGFloat = 20
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    func clear() {
        if containerView != nil {
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
    
    
    
}
