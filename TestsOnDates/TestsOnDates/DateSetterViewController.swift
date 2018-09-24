//
//  DateSetterViewController.swift
//  TestsOnDates
//
//  Created by SeoGiwon on 23/09/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

import UIKit

protocol DateSetterDelegate {
    
    func add(date: String)
}

class DateSetterViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    var delegate: DateSetterDelegate?
    var selectedDate: Date? { didSet {updateDateLabel(formatter: selectedFormatterSet, date: selectedDate)}}
    var selectedFormatterSet: String? {didSet {updateDateLabel(formatter: selectedFormatterSet, date: selectedDate)}}
    var formatterSet: [String] {
        return ["EEEE, MMM d, yyyy", "MM/dd/yyyy", "MM-dd-yyyy HH:mm", "MMM d, h:mm a", "MMMM yyyy", "MMM d, yyyy", "E, d MMM yyyy HH:mm:ss Z", "yyyy-MM-dd'T'HH:mm:ssZ", "dd.MM.yy", "d MMMM yyyy", "d MMMM", "d MMMM yyyy at h:mm a"]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false
        // Do any additional setup after loading the view.
    }

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        
        
        if selectedDate != nil {
            delegate?.add(date: label.text ?? "")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        
        selectedDate = sender.date
    }
    
    
    // MARK: - UIPickerView Data Source
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return formatterSet.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return formatterSet[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedFormatterSet = formatterSet[row]
    }
    
    func updateDateLabel(formatter: String?, date: Date?) {
        
        guard let formatter = formatter,
            let date = date else {
                return
        }
        
        if formatter.isEqual("d MMMM yyyy at h:mm a") {
            
            var dateString1: String?
            
            if startOfToday().compare(date) == .orderedAscending {
                dateString1 = "Today"
            } else if aWeekAgo().compare(date) == .orderedAscending {
                let format = DateFormatter()
                format.dateFormat = "E"
                dateString1 = format.string(from: date)
            } else {
                let format = DateFormatter()
                format.dateFormat = "d MMMM yyyy"
                dateString1 = format.string(from: date)
            }
            
            let format = DateFormatter()
            format.dateFormat = "h:mm a"
            let dateString2 = format.string(from: date)
            
            label.text = "\(dateString1!) at \(dateString2)"
            saveButton.isEnabled = true
            
            
        } else {
            let format = DateFormatter()
            format.dateFormat = formatter
            
            let dateString = format.string(from: date)
            label.text = dateString
            saveButton.isEnabled = true
        }
    }
    
    private func startOfToday() -> Date {
        
        var components = Calendar.current.dateComponents([.year, .month, .day], from: Date())
        components.hour = 0
        components.minute = 0
        components.second = 0
        let date = Calendar.current.date(from: components)
        return date!
        
    }
    
    private func aWeekAgo() -> Date {
        
        var date = Date()
        date.addTimeInterval(-3600 * 24 * 7)
        return date
    }
}
