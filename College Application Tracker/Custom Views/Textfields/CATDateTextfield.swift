//
//  CATDateTextfield.swift
//  College Application Tracker
//
//  Created by Allen Su on 2020/6/14.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import UIKit

class CATDateTextfield: CATTextField {
    
    var datePicker: UIDatePicker!
    var selectedPickupDate: Date!
    var nextTextfield: CATTextField?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    init(datePicker: UIDatePicker, selectedPickupDate: Date) {
        super.init(frame: .zero)
        self.datePicker = datePicker
        self.selectedPickupDate = selectedPickupDate

        configure()
    }
    
    func setNextTextfield (next: CATTextField) {
        nextTextfield = next
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure () {
        self.addTarget(self, action: #selector(dateTextfieldTouched), for: .editingDidBegin)
        
    }
    
    @objc func dateTextfieldTouched () {
        datePicker.date = selectedPickupDate
        datePicker.datePickerMode = UIDatePicker.Mode.date
        inputView = self.datePicker
        
        datePicker.addTarget(self, action:
            #selector(datePickerValueChanged), for:
            .valueChanged)
        addToolBar(picker: datePicker, textField: self)
    }
    
    func addToolBar(picker: UIDatePicker, textField: UITextField)
    {
        var toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = Colors.darkBlue
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        let doneButton = UIBarButtonItem(title: "Next",style: .plain, target: self, action:#selector(doneClick(sender:)))
        doneButton.tintColor = Colors.darkBlue
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target:
            nil,action: nil)
        let cancelButton = UIBarButtonItem(title:"Cancel", style: .plain, target: self, action:#selector(cancelClick(sender:)))
        cancelButton.tintColor = Colors.darkBlue
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
    }
    
    @objc func datePickerValueChanged(sender: UIDatePicker)
    {
        setPickupDate(date: sender.date)
    }
    
    func setPickupDate(date: Date)
    {
        self.text = DateHelper.convertDateToString(date: date)
    }
    
    @objc func cancelClick(sender: UIButton)
    {
        self.resignFirstResponder()
    }
    
    @objc func doneClick(sender: UIButton)
    {
        self.setPickupDate(date: datePicker.date)
        nextTextfield!.becomeFirstResponder()
        self.resignFirstResponder()
    }
    
}
