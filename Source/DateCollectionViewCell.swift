//
//  DateCollectionViewCell.swift
//  DateTimePicker
//
//  Created by Huong Do on 9/26/16.
//  Copyright © 2016 ichigo. All rights reserved.
//

import UIKit

class DateCollectionViewCell: UICollectionViewCell {
    
    // ********************************
    //
    // MARK: - Interface
    //
    // ********************************
    
    /**
     day label as `UILabel`
     */
    var dayLabel    : UILabel!
    
    /**
     number day label as `UILabel`
     */
    var numberLabel : UILabel!
    
    /**
     month label as `UILabel`
     */
    var monthLabel  : UILabel!
    
    
    // ********************************
    //
    // MARK: - Properties
    //
    // ********************************
    
    /**
     dark color as `UIColor`
     */
    var darkColor       : UIColor = UIColor(red:    0.0/255.0,
                                            green:  22.0/255.0,
                                            blue:   39.0/255.0,
                                            alpha:  1.0)
    
    /**
     highlight color as `UIColor`
     */
    var highlightColor  : UIColor = UIColor(red:    0.0/255.0,
                                            green:  199.0/255.0,
                                            blue:   194.0/255.0,
                                            alpha:  1.0)
    
    /**
     day color as `UIColor`
     */
    var dayColor        : UIColor = .white
    
    /**
     month color as `UIColor`
     */
    var monthColor      : UIColor = .white
    
    /**
     number day color as `UIColor`
     */
    var numberColor     : UIColor = .white
    
    /**
     border color as `UIColor`
     */
    var borderColor     : UIColor = UIColor(red:    199.0/255.0,
                                            green:  198.0/255.0,
                                            blue:   200.0/255.0,
                                            alpha:  1.0)
    
    /**
     background color as `UIColor`
     */
    var backColor       : UIColor = UIColor(red:    199.0/255.0,
                                            green:  198.0/255.0,
                                            blue:   200.0/255.0,
                                            alpha:  1.0)
    
    // ********************************
    //
    // MARK: - Lifecycle
    //
    // ********************************
    
    /**
     init frame
     */
    override init(frame: CGRect) {
        
        // day label
        dayLabel = UILabel(frame: CGRect(x: 5, y: 5, width: frame.width - 10, height: 20))
        dayLabel.font = UIFont.systemFont(ofSize: 10)
        dayLabel.textAlignment = .center
        
        // number label
        numberLabel = UILabel(frame: CGRect(x: 5, y: 20, width: frame.width - 10, height: 40))
        numberLabel.font = UIFont.systemFont(ofSize: 25)
        numberLabel.textAlignment = .center
        
        // month label
        monthLabel = UILabel(frame: CGRect(x: 5, y: 60, width: frame.width - 10, height: 14))
        monthLabel.font = UIFont.systemFont(ofSize: 10)
        monthLabel.textAlignment = .center
        
        super.init(frame: frame)
        
        contentView.addSubview(dayLabel)
        contentView.addSubview(numberLabel)
        contentView.addSubview(monthLabel)
        contentView.backgroundColor = darkColor.withAlphaComponent(0.1)
        contentView.layer.cornerRadius = 3
        contentView.layer.masksToBounds = true
        contentView.layer.borderWidth = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /**
     is selected cell as `Bool`
     */
    override var isSelected: Bool {
        didSet {
            dayLabel.textColor              = isSelected == true ? dayColor       : dayColor
            monthLabel.textColor            = isSelected == true ? monthColor     : monthColor
            numberLabel.textColor           = isSelected == true ? numberColor    : numberColor
            contentView.backgroundColor     = isSelected == true ? highlightColor : backColor
            contentView.layer.borderWidth   = isSelected == true ? 0 : 1
        }
    }
    
    
    // ********************************
    //
    // MARK: - Common Method
    //
    // ********************************
    
    /**
     populate item with date and custom colors
     
     - parameter date: `Date`
     - parameter highlightColor: `UIColor`
     - parameter darkColor: `UIColor`
     - parameter dayColor: `UIColor`
     - parameter monthColor: `UIColor`
     - parameter numberColor: `UIColor`
     - parameter borderColor: `UIColor`
     - parameter backColor: `UIColor`
     */
    func populateItem(date: Date, highlightColor: UIColor, darkColor: UIColor, dayColor: UIColor = .white, monthColor: UIColor = .white, numberColor: UIColor = .white, borderColor: UIColor = .clear, backColor: UIColor = .gray) {
        
        // colors
        self.highlightColor = highlightColor
        self.darkColor      = darkColor
        self.dayColor       = dayColor
        self.monthColor     = monthColor
        self.numberColor    = numberColor
        self.borderColor    = borderColor
        self.backColor      = backColor
        
        // date formatter
        let dateFormatter = DateFormatter()
        
        // day label
        dateFormatter.dateFormat = "EEEE"
        dayLabel.text = dateFormatter.string(from: date).uppercased()
        dayLabel.textColor = isSelected == true ? dayColor : dayColor
        
        // month label
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "MMMM"
        monthLabel.text = monthFormatter.string(from: date).uppercased()
        monthLabel.textColor = isSelected == true ? monthColor : monthColor
        
        // number label
        let numberFormatter = DateFormatter()
        numberFormatter.dateFormat = "d"
        numberLabel.text = numberFormatter.string(from: date)
        numberLabel.textColor = isSelected == true ? numberColor : numberColor
        
        // cell style
        contentView.layer.borderColor = borderColor.cgColor
        contentView.backgroundColor = isSelected == true ? highlightColor : backColor
    }
}
