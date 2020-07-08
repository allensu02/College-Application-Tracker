//
//  CATPickerView.swift
//  College Application Tracker
//
//  Created by Allen Su on 2020/6/15.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import UIKit

protocol ToolbarPickerViewDelegate: class {
    func didTapDone()
    func didTapCancel()
}

class CATPickerView: UIPickerView {

    public private(set) var toolbar: UIToolbar?
    public weak var toolbarDelegate: ToolbarPickerViewDelegate?
    
    var doneButton: UIBarButtonItem!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func setButtonTextDone () {
        doneButton.title = "Done"
    }
    
    private func commonInit() {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = .black
        toolBar.sizeToFit()

        doneButton = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(self.doneTapped))
        doneButton.tintColor = Colors.darkBlue
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelTapped))
        cancelButton.tintColor = Colors.darkBlue
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        self.toolbar = toolBar
    }
    
    @objc func doneTapped() {
        self.toolbarDelegate?.didTapDone()
    }
    
    @objc func cancelTapped() {
        self.toolbarDelegate?.didTapCancel()
    }
    
    
}
