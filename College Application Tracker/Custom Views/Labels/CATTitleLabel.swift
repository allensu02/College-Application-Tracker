//
//  CATTitleLabel.swift
//  College Application Tracker
//
//  Created by Allen Su on 2020/6/12.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import UIKit

class CATTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init (textAlignment: NSTextAlignment, fontSize: CGFloat) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont(name: "futura", size: fontSize)
        configure()
    }
    
    private func configure() {
        textColor = Colors.darkBlue
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func set(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
    }

}
