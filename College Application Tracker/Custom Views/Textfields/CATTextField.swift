//
//  CATTextField.swift
//  College Application Tracker
//
//  Created by Allen Su on 2020/6/13.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import UIKit

class CATTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init (placeholder: String) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        configure()
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = Colors.darkBlue.cgColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont(name: "futura", size: 20)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        autocapitalizationType = .words
        autocorrectionType = .yes
        
        backgroundColor = .tertiarySystemBackground
        clearButtonMode = .whileEditing
        returnKeyType = .next
    }

}
