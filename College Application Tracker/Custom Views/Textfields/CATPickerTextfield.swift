//
//  CATPickerTextfield.swift
//  College Application Tracker
//
//  Created by Allen Su on 2020/6/14.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import UIKit

class CATPickerTextfield: CATTextField {

    var pickerView: CATPickerView!
    var items: [String]!
    var view: CATNewCollegeView!
    var nextTextfield: CATPickerTextfield?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(placeHolder: String, pickerView: CATPickerView, items: [String], view: UIView) {
        super.init(placeholder: placeHolder)
        self.pickerView = pickerView
        self.items = items
        configure()
    }
    
    func setNextTextfield (next: CATPickerTextfield) {
        nextTextfield = next
    }
    
    func configure () {
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.toolbarDelegate = self
        self.inputView = pickerView
        self.inputAccessoryView = pickerView.toolbar
        let heightAnchor = pickerView.heightAnchor.constraint(equalToConstant: 216)
        //heightAnchor.isActive = true
        //NSLayoutConstraint.activate([heightAnchor])
      
    }

    
}

extension CATPickerTextfield: UIPickerViewDataSource, UIPickerViewDelegate, ToolbarPickerViewDelegate {
    func didTapDone() {
        let row = self.pickerView.selectedRow(inComponent: 0)
        pickerView.selectRow(row, inComponent: 0, animated: false)
        text = items[row]
        
        if let nextResponder = nextTextfield {
            nextResponder.becomeFirstResponder()
        } else {
            resignFirstResponder()
        }
    }
    
    
    
    func didTapCancel() {
        text = nil
        resignFirstResponder()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.text = items[row]
    }
}
