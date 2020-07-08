//
//  CATBodyLabel.swift
//  College Application Tracker
//
//  Created by Allen Su on 2020/6/13.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import UIKit

class CATBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init (textAlignment: NSTextAlignment) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
    }
    
    private func configure() {
        textColor = Colors.darkBlue
        adjustsFontSizeToFitWidth = true
        font = UIFont.preferredFont(forTextStyle: .body)
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }
}
