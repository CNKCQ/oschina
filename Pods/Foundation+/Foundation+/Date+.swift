//
//  Date.swift
//  Elegant
//
//  Created by Steve on 2017/5/18.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import Foundation

public extension Date {

    /// Returns the earlier of the receiver and another given date.
    ///
    /// - Parameter date: The date with which to compare the receiver.
    /// - Returns: The earlier of the receiver
    func earlierDate(_ date: Date) -> Date {
        let now = Date()
        return now < date ? now : date
    }

    /// Returns the later of the receiver and another given date.
    ///
    /// - Parameter date: The date with which to compare the receiver.
    /// - Returns: The later of the receiver
    func laterDate(_ date: Date) -> Date {
        let now = Date()
        return now < date ? date : now
    }

    /// Takes a past Date and creates a string representation of it.
    ///
    /// - Parameters:
    ///   - date: Past date you wish to create a string representation for.
    ///   - numericDates: if true, ex: "1 week ago", else ex: "Last week"
    /// - Returns:  String that represents your date.
    static func timeAgoSinceDate(_ date: Date, numericDates: Bool) -> String {
        let calendar = Calendar.current
        let now = Date()
        let earliest = now.earlierDate(date)
        let latest = (earliest == now) ? date : now
        let components = calendar.dateComponents([.minute, .hour, .day, .weekOfYear, .month, .year, .second], from: earliest, to: latest)
        if components.year! >= 2 {
            return "\(String(describing: components.year)) years ago"
        } else if components.year! >= 1 {
            if numericDates {
                return "1 year ago"
            } else {
                return "Last year"
            }
        } else if components.month! >= 2 {
            return "\(String(describing: components.month)) months ago"
        } else if components.month! >= 1 {
            if numericDates {
                return "1 month ago"
            } else {
                return "Last month"
            }
        } else if components.weekOfYear! >= 2 {
            return "\(String(describing: components.weekOfYear)) weeks ago"
        } else if components.weekOfYear! >= 1 {
            if numericDates {
                return "1 week ago"
            } else {
                return "Last week"
            }
        } else if components.day! >= 2 {
            return "\(String(describing: components.day)) days ago"
        } else if components.day! >= 1 {
            if numericDates {
                return "1 day ago"
            } else {
                return "Yesterday"
            }
        } else if components.hour! >= 2 {
            return "\(String(describing: components.hour)) hours ago"
        } else if components.hour! >= 1 {
            if numericDates {
                return "1 hour ago"
            } else {
                return "An hour ago"
            }
        } else if components.minute! >= 2 {
            return "\(String(describing: components.minute)) minutes ago"
        } else if components.minute! >= 1 {
            if numericDates {
                return "1 minute ago"
            } else {
                return "A minute ago"
            }
        } else if components.second! >= 3 {
            return "\(String(describing: components.second)) seconds ago"
        } else {
            return "just now"
        }
    }
}
