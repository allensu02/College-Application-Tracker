//
//  CATSubmittedCellView.swift
//  College Application Tracker
//
//  Created by Allen Su on 2020/6/20.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import UIKit

class CATSubmittedCellView: UIView {

    var collegeNameLabel: CATTitleLabel!
    var majorLabel: CATSecondaryTitleLabel!
    var typeLabel: CATSecondaryTitleLabel!
    var tierLabel: CATSecondaryTitleLabel!
    var submittedLabel: CATSecondaryTitleLabel!
    var releaseLabel: CATSecondaryTitleLabel!
    var college: SubmittedCollege!

    let padding: CGFloat = 10
    var labelColor = Colors.darkBlue
    var bkgColor = Colors.lightGreen.withAlphaComponent(0.5)
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init (college: SubmittedCollege) {
        super.init(frame: .zero)
        self.college = college
        configure()
    }
    
    func configure () {
        backgroundColor = bkgColor
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 15
        layer.masksToBounds = true
        
        configureNameLabel()
        configureMajorLabel()
        configureTypeLabel()
        configureTierLabel()
        configureSubmittedLabel()
        configureReleaseLabel()
    }
    
    func configureNameLabel () {
        collegeNameLabel = CATTitleLabel(textAlignment: .left, fontSize: 30)
        //2, 167, 204
        collegeNameLabel.textColor = labelColor
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
        majorLabel = CATSecondaryTitleLabel(fontSize: 20)
        majorLabel.textColor = labelColor
        addSubview(majorLabel)
        NSLayoutConstraint.activate([
            majorLabel.topAnchor.constraint(equalTo: collegeNameLabel.bottomAnchor, constant: 5),
            majorLabel.leadingAnchor.constraint(equalTo: collegeNameLabel.leadingAnchor),
            majorLabel.trailingAnchor.constraint(equalTo: collegeNameLabel.trailingAnchor),
            majorLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
        majorLabel.text = "\(college.major)"
    }
    
    func configureTypeLabel () {
        typeLabel = CATSecondaryTitleLabel(fontSize: 20)
        addSubview(typeLabel)
        typeLabel.textColor = labelColor
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
    
    func configureTierLabel  () {
        tierLabel = CATSecondaryTitleLabel(fontSize: 20)
        addSubview(tierLabel)
        tierLabel.textColor = labelColor
        NSLayoutConstraint.activate([
            tierLabel.topAnchor.constraint(equalTo: majorLabel.bottomAnchor, constant: 5),
            tierLabel.leadingAnchor.constraint(equalTo: collegeNameLabel.leadingAnchor),
            tierLabel.widthAnchor.constraint(equalToConstant: 180),
            tierLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
        tierLabel.text = "\(college.tier) School"
    }
    
    func configureSubmittedLabel () {
        submittedLabel = CATSecondaryTitleLabel(fontSize: 20)
        submittedLabel.textColor = labelColor
        submittedLabel.textAlignment = .right
        addSubview(submittedLabel)
        NSLayoutConstraint.activate([
            submittedLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 5),
            submittedLabel.widthAnchor.constraint(equalToConstant: 120),
            submittedLabel.trailingAnchor.constraint(equalTo: typeLabel.trailingAnchor),
            submittedLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        
        let submittedString = college.submittedDate
        submittedLabel.text = "\(submittedString!)"
    }
    
    func configureReleaseLabel () {
        releaseLabel = CATSecondaryTitleLabel(fontSize: 20)
        releaseLabel.textColor = labelColor
        releaseLabel.textAlignment = .right
        addSubview(releaseLabel)
        NSLayoutConstraint.activate([
            releaseLabel.topAnchor.constraint(equalTo: submittedLabel.bottomAnchor, constant: 5),
            releaseLabel.widthAnchor.constraint(equalToConstant: 120),
            releaseLabel.trailingAnchor.constraint(equalTo: typeLabel.trailingAnchor),
            releaseLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        
        let releaseString = college.decisionRelease
        releaseLabel.text = "\(releaseString!)"
    }
}
