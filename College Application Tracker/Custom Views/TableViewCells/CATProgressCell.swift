//
//  CATProgressCell.swift
//  College Application Tracker
//
//  Created by Allen Su on 2020/6/12.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import UIKit

class CATProgressCell: UITableViewCell {
    
    
    var college: InProgressCollege!
    
    let padding: CGFloat = 10
    var inProgressContainer: CATInProgressCellContainerView!
    static let reuseID = "progressCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(college: InProgressCollege) {
        self.college = college
        self.configure()
        
    }
    
    func configure () {
        inProgressContainer = CATInProgressCellContainerView(college: college)
        selectionStyle = .none
        clipsToBounds = true
        addSubview(inProgressContainer)
        NSLayoutConstraint.activate([
            inProgressContainer.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            inProgressContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            inProgressContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            inProgressContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)

        ])
    }
    
    func clear() {
        if inProgressContainer != nil {
            inProgressContainer.removeFromSuperview()
            inProgressContainer = nil
        }
    }
    
   
}
