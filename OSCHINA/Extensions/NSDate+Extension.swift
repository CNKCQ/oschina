//
//  Copyright © 2016年 Jack. All rights reserved.
//  Created by KingCQ on 16/8/31.
//
import Foundation


extension NSDate {
    /**
     Takes a past NSDate and creates a string representation of it.

     ex: "1 week ago"

     ex: "Last week"

     - Parameter date: Past date you wish to create a string representation for.
     - Parameter numericDates: if true, ex: "1 week ago", else ex: "Last week"
     - Returns: String that represents your date.
     */
    // swiftlint:disable function_body_length
    // swiftlint:disable cyclomatic_complexity
    public func timeAgoSinceDate(date: NSDate, numericDates: Bool) -> String {
        let calendar = NSCalendar.currentCalendar()
        let now = NSDate()
        let earliest = now.earlierDate(date)
        let latest = (earliest == now) ? date : now
        // swiftlint:disable line_length
        let components: NSDateComponents = calendar.components([NSCalendarUnit.Minute, NSCalendarUnit.Hour, NSCalendarUnit.Day, NSCalendarUnit.WeekOfYear, NSCalendarUnit.Month, NSCalendarUnit.Year, NSCalendarUnit.Second], fromDate: earliest, toDate: latest, options: NSCalendarOptions())

        if components.year >= 2 {
            return "\(components.year) years ago"
        } else if components.year >= 1 {
            if numericDates {
                return "1 year ago"
            } else {
                return "Last year"
            }
        } else if components.month >= 2 {
            return "\(components.month) months ago"
        } else if components.month >= 1 {
            if numericDates {
                return "1 month ago"
            } else {
                return "Last month"
            }
        } else if components.weekOfYear >= 2 {
            return "\(components.weekOfYear) weeks ago"
        } else if components.weekOfYear >= 1 {
            if numericDates {
                return "1 week ago"
            } else {
                return "Last week"
            }
        } else if components.day >= 2 {
            return "\(components.day) days ago"
        } else if components.day >= 1 {
            if numericDates {
                return "1 day ago"
            } else {
                return "Yesterday"
            }
        } else if components.hour >= 2 {
            return "\(components.hour) hours ago"
        } else if components.hour >= 1 {
            if numericDates {
                return "1 hour ago"
            } else {
                return "An hour ago"
            }
        } else if components.minute >= 2 {
            return "\(components.minute) minutes ago"
        } else if components.minute >= 1 {
            if numericDates {
                return "1 minute ago"
            } else {
                return "A minute ago"
            }
        } else if components.second >= 3 {
            return "\(components.second) seconds ago"
        } else {
            return "just now"
        }
    }
}
