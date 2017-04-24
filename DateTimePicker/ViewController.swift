//
//  ViewController.swift
//  DateTimePicker
//
//  Created by Huong Do on 9/16/16.
//  Copyright © 2016 ichigo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var item: UINavigationItem!
    var current = Date()

    @IBAction func showDateTimePicker(sender: AnyObject) {
        let min = Date().addingTimeInterval(-3600 * 12)
        let max = Date().addingTimeInterval(3600 * 24 * 365 * 4)
        
        // iphone support + ipad split screen
        let frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        let picker = DateTimePicker.show(selected: current, minimumDate: min, maximumDate: max, frame: frame, padding: 8.0)
        picker.cornerRadius = 8.0
        picker.backgroundViewColor = UIColor.black.withAlphaComponent(0.6)
        picker.highlightColor = UIColor(red: 55.0/255.0, green: 86.0/255.0, blue: 131.0/255.0, alpha: 1)
        
        picker.doneButtonTitle = "!! DONE DONE !!"
        picker.todayButtonTitle = "Today"
        picker.completionHandler = { date in
            self.current = date
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm dd/MM/YYYY"
            self.item.title = formatter.string(from: date)
        }
    }

}

