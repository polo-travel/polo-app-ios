//
//  DateExtension.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 06/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.locale = Locale(identifier: "FR-fr")
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
    
    var midnight: Date {
        var cal = Calendar.current
        cal.timeZone = TimeZone(identifier: "Europe/Paris")!
        return cal.startOfDay(for: self)
    }
    var midday: Date {
        var cal = Calendar.current
        cal.timeZone = TimeZone(identifier: "Europe/Paris")!
        return cal.date(byAdding: .hour, value: 12, to: self.midnight)!
    }
}
