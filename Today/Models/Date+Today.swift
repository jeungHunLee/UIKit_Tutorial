//
//  Date+Today.swift
//  Today
//
//  Created by 이정훈 on 12/19/23.
//

import Foundation

extension Date {
    var dayAndTimeText: String {
        if Locale.current.calendar.isDateInToday(self) {
            let timeText = formatted(date: .omitted, time: .shortened)
            let timeFormat = NSLocalizedString("Today at %@", comment: "Today at time format string")
            return String(format: timeFormat, timeText)
        } else {
            let dateText = formatted(.dateTime.month(.abbreviated).day())
            let dateAndTimeFormat = NSLocalizedString("%@ at %@", comment: "Date and time format string")
            return String(format: dateAndTimeFormat, dateText)
        }
    }
    
    var dayText: String {
        if Locale.current.calendar.isDateInToday(self) {
            return NSLocalizedString("Today", comment: "Today due date description")
        } else {
            return formatted(.dateTime.month().day().weekday(.wide))
        }
    }
}
