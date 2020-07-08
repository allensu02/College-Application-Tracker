//
//  CATContainerView.swift
//  College Application Tracker
//
//  Created by Allen Su on 2020/6/13.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import UIKit

class CATInProgressCellContainerView: UIView {

    var collegeNameLabel: CATTitleLabel!
    var majorLabel: CATSecondaryTitleLabel!
    var deadlineLabel: CATSecondaryTitleLabel!
    var typeLabel: CATSecondaryTitleLabel!
    var priorityImage: UIImageView!
    var priorityLabel: CATSecondaryTitleLabel!
    var priorityStackView: UIStackView!
    var tierLabel: CATSecondaryTitleLabel!
    
    var college: InProgressCollege!

    let padding: CGFloat = 10

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init (college: InProgressCollege) {
        super.init(frame: .zero)
        self.college = college
        configure()
    }
    
    func configure () {
        backgroundColor = Colors.lightGreen.withAlphaComponent(0.5)
        
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 15
        layer.masksToBounds = true
        
        configureNameLabel()
        configureMajorLabel()
        configureTypeLabel()
        configureDeadlineLabel()
        
        configurePriorityView()
        configureTierLabel()
        
    }
    
    func configureNameLabel () {
        collegeNameLabel = CATTitleLabel(textAlignment: .left, fontSize: 27)
        //2, 167, 204
        collegeNameLabel.textColor = Colors.darkBlue
        collegeNameLabel.minimumScaleFactor = 0.6
        collegeNameLabel.adjustsFontSizeToFitWidth = true
        addSubview(collegeNameLabel)
        NSLayoutConstraint.activate([
            collegeNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            collegeNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            collegeNameLabel.widthAnchor.constraint(equalToConstant: 180),
            collegeNameLabel.heightAnchor.constraint(equalToConstant: 36)
        ])
        collegeNameLabel.text = college.collegeName
    }
    
    func configureMajorLabel () {
        majorLabel = CATSecondaryTitleLabel(fontSize: 18)
        majorLabel.textColor = Colors.darkBlue
        addSubview(majorLabel)
        NSLayoutConstraint.activate([
            majorLabel.topAnchor.constraint(equalTo: collegeNameLabel.bottomAnchor, constant: 5),
            majorLabel.leadingAnchor.constraint(equalTo: collegeNameLabel.leadingAnchor),
            majorLabel.trailingAnchor.constraint(equalTo: collegeNameLabel.trailingAnchor),
            majorLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
        majorLabel.text = "\(college.major)"
    }
    
    func configureDeadlineLabel () {
        deadlineLabel = CATSecondaryTitleLabel(fontSize: 18)
        deadlineLabel.textColor = Colors.darkBlue
        deadlineLabel.textAlignment = .right
        addSubview(deadlineLabel)
        NSLayoutConstraint.activate([
            deadlineLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 5),
            deadlineLabel.widthAnchor.constraint(equalToConstant: 120),
            deadlineLabel.trailingAnchor.constraint(equalTo: typeLabel.trailingAnchor),
            deadlineLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        
        let deadlineString = college.deadline
        deadlineLabel.text = "\(deadlineString!)"
    }
    
    func configureTypeLabel () {
        typeLabel = CATSecondaryTitleLabel(fontSize: 18)
        addSubview(typeLabel)
        typeLabel.textColor = Colors.darkBlue
        typeLabel.textAlignment = .right
        typeLabel.minimumScaleFactor = 0.75
        typeLabel.adjustsFontSizeToFitWidth = true
        NSLayoutConstraint.activate([
            typeLabel.bottomAnchor.constraint(equalTo: collegeNameLabel.bottomAnchor),
            typeLabel.leadingAnchor.constraint(equalTo: collegeNameLabel.trailingAnchor, constant: padding),
            typeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            typeLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
        typeLabel.text = "\(college.type)"
    }
    
    func configurePriorityView  () {
        
        var textName = ""
        var image = UIImage()
        
        priorityLabel = CATSecondaryTitleLabel(fontSize: 18)
        priorityImage = UIImageView()

        switch college.priority {
        case "Critical":
            textName = "Critical"
            image = PriorityIcons.critical
            priorityLabel.textColor = .systemRed
        case "High":
            textName = "High"
            image = PriorityIcons.high
            priorityLabel.textColor = .systemRed
        case "Medium":
            textName = "Medium"
            image = PriorityIcons.medium
            priorityLabel.textColor = .systemOrange
        case "Low":
            textName = "Low"
            image = PriorityIcons.low
            priorityLabel.textColor = .systemGreen
        default:
            textName = "Low"
            image = PriorityIcons.low
            priorityLabel.textColor = .systemGreen
        }
        priorityImage.contentMode = .scaleAspectFit
        priorityImage.heightAnchor.constraint(equalToConstant: 36).isActive = true
        priorityImage.widthAnchor.constraint(equalToConstant: 36).isActive = true
        priorityImage.image = image
        
        priorityLabel.heightAnchor.constraint(equalToConstant: 36).isActive = true
        priorityLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        priorityLabel.text = textName
        priorityLabel.textAlignment = .right
        
        priorityStackView = UIStackView(arrangedSubviews: [priorityLabel, priorityImage])
        priorityStackView.translatesAutoresizingMaskIntoConstraints = false
        priorityStackView.axis = .horizontal
        priorityStackView.spacing = 10
        priorityStackView.distribution = .fill
        priorityStackView.alignment = .trailing
        addSubview(priorityStackView)
        
        NSLayoutConstraint.activate([
            priorityStackView.topAnchor.constraint(equalTo: deadlineLabel.bottomAnchor),
            priorityStackView.leadingAnchor.constraint(equalTo: collegeNameLabel.trailingAnchor, constant: padding),
            priorityStackView.trailingAnchor.constraint(equalTo: typeLabel.trailingAnchor),
            priorityStackView.heightAnchor.constraint(equalToConstant: 36)
        ])
        
    }
    
    func configureTierLabel  () {
        tierLabel = CATSecondaryTitleLabel(fontSize: 18)
        addSubview(tierLabel)
        tierLabel.textColor = Colors.darkBlue
        NSLayoutConstraint.activate([
            tierLabel.topAnchor.constraint(equalTo: majorLabel.bottomAnchor, constant: 5),
            tierLabel.leadingAnchor.constraint(equalTo: collegeNameLabel.leadingAnchor),
            tierLabel.widthAnchor.constraint(equalToConstant: 180),
            tierLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
        tierLabel.text = "\(college.tier) School"
    }
}
