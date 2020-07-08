//
//  NewCollegeView.swift
//  College Application Tracker
//
//  Created by Allen Su on 2020/6/13.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import UIKit
import AnimatedField

class CATNewCollegeView: UIView {
    
    var format: AnimatedFieldFormat!
    
    var universityNameTextfield: AnimatedField!
    
    var majorTextfield: AnimatedField!
    
    var deadlineLabel: CATTitleLabel!
    var deadlineTextfield: AnimatedField!
    var deadlinePicker: UIDatePicker!
    
    var typeLabel: CATTitleLabel!
    var typeTextfield: CATPickerTextfield!
    var typePicker: CATPickerView!
    
    var priorityLabel: CATTitleLabel!
    var priorityTextfield: CATPickerTextfield!
    var priorityPicker: CATPickerView!
    
    var tierLabel: CATTitleLabel!
    var tierTextfield: CATPickerTextfield!
    var tierPicker: CATPickerView!
    
    var addCollegeButton: CATButton!
    
    let types = ["Regular Decision", "Early Action", "Early Decision", "Restrictive EA"]
    let priorities = ["Critical", "High", "Medium", "Low"]
    let tiers = ["Dream", "Reach", "Target", "Safety"]
    //jan 1, 2021
    let selectedPickupDate = Date(timeIntervalSinceReferenceDate: 631_152_000)
    
    let textfieldHeight: CGFloat = 40
    let labelFontSize: CGFloat = 20
    let labelHeight: CGFloat = 25
    var sectionPadding: CGFloat = 40
    var labelTextfieldPadding: CGFloat = 10
    var buttonPadding: CGFloat = 20
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure () {
        configureFormat()
        configureUniversity()
        configureMajor()
        configureDeadline()
        configureType()
        configurePriority()
        configureTier()
        configureButton()
        configureTextfields()
        addGesture()
    }
    
    func addGesture () {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.addGestureRecognizer(tap)
    }
    
    func configureUniversity() {
        configureTextfield(textfield: &universityNameTextfield, tag: 0, placeholder: "Name")
        
        NSLayoutConstraint.activate([
            universityNameTextfield.topAnchor.constraint(equalTo: topAnchor, constant: 150),
            universityNameTextfield.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            universityNameTextfield.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            universityNameTextfield.heightAnchor.constraint(equalToConstant: textfieldHeight)
        ])
        
    }
    
    func configureMajor () {
        configureTextfield(textfield: &majorTextfield, tag: 1, placeholder: "Major")
        NSLayoutConstraint.activate([
            majorTextfield.topAnchor.constraint(equalTo: universityNameTextfield.bottomAnchor, constant: sectionPadding),
            majorTextfield.leadingAnchor.constraint(equalTo: universityNameTextfield.leadingAnchor),
            majorTextfield.trailingAnchor.constraint(equalTo: universityNameTextfield.trailingAnchor),
            majorTextfield.heightAnchor.constraint(equalToConstant: textfieldHeight)
        ])
    }
    
    func configureDeadline () {
        configureTextfield(textfield: &deadlineTextfield, tag: 2, placeholder: "Deadline")
        deadlineTextfield.type = .datepicker(UIDatePicker.Mode.date, selectedPickupDate, nil, nil, "Done", "MM/dd/yyyy")
        NSLayoutConstraint.activate([
            deadlineTextfield.topAnchor.constraint(equalTo: majorTextfield.bottomAnchor, constant: sectionPadding),
            deadlineTextfield.leadingAnchor.constraint(equalTo: universityNameTextfield.leadingAnchor),
            deadlineTextfield.trailingAnchor.constraint(equalTo: universityNameTextfield.trailingAnchor),
            deadlineTextfield.heightAnchor.constraint(equalToConstant: textfieldHeight)
        ])
        
        
    }
    
    func configureType () {
        configureCATLabelAndPickerTextfield(label: &typeLabel, picker: &typePicker, textfield: &typeTextfield, labelText: "Application Type", placeholder: "Type", items: types)
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalTo: deadlineTextfield.bottomAnchor, constant: sectionPadding),
            typeLabel.leadingAnchor.constraint(equalTo: universityNameTextfield.leadingAnchor),
            typeLabel.trailingAnchor.constraint(equalTo: universityNameTextfield.trailingAnchor),
            typeLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            
            typeTextfield.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: labelTextfieldPadding),
            typeTextfield.leadingAnchor.constraint(equalTo: universityNameTextfield.leadingAnchor),
            typeTextfield.trailingAnchor.constraint(equalTo: universityNameTextfield.trailingAnchor),
            typeTextfield.heightAnchor.constraint(equalToConstant: textfieldHeight)
        ])
    }
    
    func configurePriority () {
        configureCATLabelAndPickerTextfield(label: &priorityLabel, picker: &priorityPicker, textfield: &priorityTextfield, labelText: "Application Priority", placeholder: "Priority", items: priorities)
        NSLayoutConstraint.activate([
            priorityLabel.topAnchor.constraint(equalTo: typeTextfield.bottomAnchor, constant: 20),
            priorityLabel.leadingAnchor.constraint(equalTo: universityNameTextfield.leadingAnchor),
            priorityLabel.trailingAnchor.constraint(equalTo: universityNameTextfield.trailingAnchor),
            priorityLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            
            priorityTextfield.topAnchor.constraint(equalTo: priorityLabel.bottomAnchor, constant: labelTextfieldPadding),
            priorityTextfield.leadingAnchor.constraint(equalTo: universityNameTextfield.leadingAnchor),
            priorityTextfield.trailingAnchor.constraint(equalTo: universityNameTextfield.trailingAnchor),
            priorityTextfield.heightAnchor.constraint(equalToConstant: textfieldHeight)
        ])
    }
    
    func configureTier () {
        configureCATLabelAndPickerTextfield(label: &tierLabel, picker: &tierPicker, textfield: &tierTextfield, labelText: "Application Tier", placeholder: "Tier", items: tiers)
        NSLayoutConstraint.activate([
            tierLabel.topAnchor.constraint(equalTo: priorityTextfield.bottomAnchor, constant: 20),
            tierLabel.leadingAnchor.constraint(equalTo: universityNameTextfield.leadingAnchor),
            tierLabel.trailingAnchor.constraint(equalTo: universityNameTextfield.trailingAnchor),
            tierLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            
            tierTextfield.topAnchor.constraint(equalTo: tierLabel.bottomAnchor, constant: labelTextfieldPadding),
            tierTextfield.leadingAnchor.constraint(equalTo: universityNameTextfield.leadingAnchor),
            tierTextfield.trailingAnchor.constraint(equalTo: universityNameTextfield.trailingAnchor),
            tierTextfield.heightAnchor.constraint(equalToConstant: textfieldHeight)
        ])
    }
    
    func configureButton () {
        addCollegeButton = CATButton(backgroundColor: Colors.lightGreen.withAlphaComponent(0.5), title: "Add College")
        addSubview(addCollegeButton)
        
        NSLayoutConstraint.activate([
            addCollegeButton.topAnchor.constraint(equalTo: tierTextfield.bottomAnchor, constant: buttonPadding),
            addCollegeButton.leadingAnchor.constraint(equalTo: universityNameTextfield.leadingAnchor),
            addCollegeButton.trailingAnchor.constraint(equalTo: universityNameTextfield.trailingAnchor),
            addCollegeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureCATLabelAndPickerTextfield(label: inout CATTitleLabel?, picker: inout CATPickerView?, textfield: inout CATPickerTextfield?, labelText: String, placeholder: String, items: [String]) {
        
        label = CATTitleLabel(textAlignment: .left, fontSize: labelFontSize)
        label?.textColor = Colors.darkBlue
        label!.text = labelText
        picker = CATPickerView(frame: CGRect(x: 0, y: 200, width: self.frame.width, height: 300))
        picker!.translatesAutoresizingMaskIntoConstraints = false
        textfield = CATPickerTextfield(placeHolder: placeholder, pickerView: picker!, items: items, view: self)
        
        addSubview(label!)
        addSubview(textfield!)
        
        picker!.reloadAllComponents()
    }
    
    @objc func dismissKeyboard()
    {
        self.endEditing(true)
    }
    
    func configureTextfield (textfield: inout AnimatedField?, tag: Int, placeholder: String) {
        textfield = AnimatedField()
        textfield!.format = format
        textfield!.type = AnimatedFieldType.none
        textfield!.text = ""
        textfield!.attributedPlaceholder = NSAttributedString(string: placeholder, attributes:[.foregroundColor: Colors.darkBlue])
        textfield!.showVisibleButton = false
        textfield!.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textfield!)
        textfield!.tag = tag
        textfield?.delegate = self
        textfield?.dataSource = self
    }
    
    
    func configureTextfields () {
        typeTextfield.setNextTextfield(next: priorityTextfield)
        priorityTextfield.setNextTextfield(next: tierTextfield)
        tierTextfield.pickerView.setButtonTextDone()
    }
    
    
    func configureFormat () {
        format = AnimatedFieldFormat()
        format.titleAlwaysVisible = false
        format.titleFont = UIFont(name: "futura", size: labelFontSize)!
        format.textFont = UIFont(name: "futura", size: labelFontSize)!
        format.lineColor = Colors.darkBlue
        format.titleColor = Colors.darkBlue
        format.textColor = Colors.darkBlue
        format.counterColor = Colors.darkBlue
        format.alertEnabled = true
        format.alertFont = UIFont(name: "futura", size: labelFontSize)!
        format.alertColor = UIColor.red
        format.alertFieldActive = true
        format.alertLineActive = true
        format.alertTitleActive = true
        format.alertPosition = .top
        format.counterEnabled = false
        format.countDown = false
        format.counterAnimation = false
        format.highlightColor = Colors.darkGreen
    }
}

extension CATNewCollegeView: UITextFieldDelegate, AnimatedFieldDelegate, AnimatedFieldDataSource {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        textField.resignFirstResponder()
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    
}
