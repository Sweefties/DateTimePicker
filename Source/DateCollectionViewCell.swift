//
//  DateCollectionViewCell.swift
//  DateTimePicker
//
//  Created by Huong Do on 9/26/16.
//  Copyright © 2016 ichigo. All rights reserved.
//

import UIKit

class DateCollectionViewCell: UICollectionViewCell {
    var dayLabel: UILabel! // rgb(128,138,147)
    var numberLabel: UILabel!
    var monthLabel: UILabel!//test
    var darkColor = UIColor(red: 0, green: 22.0/255.0, blue: 39.0/255.0, alpha: 1)
    var highlightColor = UIColor(red: 0/255.0, green: 199.0/255.0, blue: 194.0/255.0, alpha: 1)
    
    override init(frame: CGRect) {
        
        dayLabel = UILabel(frame: CGRect(x: 5, y: 5, width: frame.width - 10, height: 20))
        dayLabel.font = UIFont.systemFont(ofSize: 10)
        dayLabel.textAlignment = .center
        
        numberLabel = UILabel(frame: CGRect(x: 5, y: 20, width: frame.width - 10, height: 40))
        numberLabel.font = UIFont.systemFont(ofSize: 25)
        numberLabel.textAlignment = .center
        //-test
        monthLabel = UILabel(frame: CGRect(x: 5, y: 60, width: frame.width - 10, height: 14))
        monthLabel.font = UIFont.systemFont(ofSize: 10)
        monthLabel.textAlignment = .center
        //-end test
        super.init(frame: frame)
        
        contentView.addSubview(dayLabel)
        contentView.addSubview(numberLabel)
        contentView.addSubview(monthLabel)//test
        //contentView.backgroundColor = .white
        contentView.backgroundColor = darkColor.withAlphaComponent(0.1)//test
        contentView.layer.cornerRadius = 3
        contentView.layer.masksToBounds = true
        contentView.layer.borderWidth = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
        didSet {
            dayLabel.textColor = isSelected == true ? .white : .white//darkColor.withAlphaComponent(0.5)
            monthLabel.textColor = isSelected == true ? .white : .white//darkColor.withAlphaComponent(0.5)//test
            numberLabel.textColor = isSelected == true ? .white : .white//darkColor
            //contentView.backgroundColor = isSelected == true ? highlightColor : .white
            contentView.backgroundColor = isSelected == true ? highlightColor : UIColor(red: 199.0/255.0, green: 198.0/255.0, blue: 200.0/255.0, alpha: 1.0)//darkColor.withAlphaComponent(0.1)
            contentView.layer.borderWidth = isSelected == true ? 0 : 1
        }
    }
    
    func populateItem(date: Date, highlightColor: UIColor, darkColor: UIColor) {
        self.highlightColor = highlightColor
        self.darkColor = darkColor
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dayLabel.text = dateFormatter.string(from: date).uppercased()
        dayLabel.textColor = isSelected == true ? .white : .white//darkColor.withAlphaComponent(0.5)
        
        //-test
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "MMMM"
        monthLabel.text = monthFormatter.string(from: date).uppercased()
        monthLabel.textColor = isSelected == true ? .white : .white//darkColor.withAlphaComponent(0.5)
        //-end test
        
        let numberFormatter = DateFormatter()
        numberFormatter.dateFormat = "d"
        numberLabel.text = numberFormatter.string(from: date)
        numberLabel.textColor = isSelected == true ? .white : .white//darkColor
        
        contentView.layer.borderColor = UIColor(red: 199.0/255.0, green: 198.0/255.0, blue: 200.0/255.0, alpha: 1.0).cgColor//darkColor.withAlphaComponent(0.2).cgColor
        //contentView.backgroundColor = isSelected == true ? highlightColor : .white
        contentView.backgroundColor = isSelected == true ? highlightColor : UIColor(red: 199.0/255.0, green: 198.0/255.0, blue: 200.0/255.0, alpha: 1.0)//darkColor.withAlphaComponent(0.1)
    }
    
}
