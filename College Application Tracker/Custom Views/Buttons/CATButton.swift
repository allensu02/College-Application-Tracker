//
//  CATButton.swift
//  College Application Tracker
//
//  Created by Allen Su on 2020/6/13.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import UIKit

class CATButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor: UIColor, title: String) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
    }
    
    private func configure() {
        layer.cornerRadius = 10
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        setTitleColor(Colors.darkGreen, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderColor = Colors.darkGreen.cgColor
        layer.borderWidth = 2
    }
    
    func set(backgroundColor: UIColor, title: String) {
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
    }

}
