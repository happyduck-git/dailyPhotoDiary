//
//  Date+Extension.swift
//  photoDiary
//
//  Created by HappyDuck on 2022/01/12.
//

import Foundation
import UIKit
extension Date {
    static func calculateDate(day:Int, month: Int, year: Int, hour: Int, minute: Int)-> Date{
        let formmater = DateFormatter()
        formmater.dateFormat = "yyyy/MM/dd HH:mm"
        formmater.locale = Locale(identifier: "Korea")
        formmater.timeZone = TimeZone(secondsFromGMT: 0)
        let calculatedDate = formmater.date(from: "\(hour):\(minute)")
        return calculatedDate!
    }
    func getHourMinute() -> (hour:Int, minute:Int) {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: self)
        let minute = calendar.component(.minute, from: self)
        
        return(hour,minute)
    }
}
