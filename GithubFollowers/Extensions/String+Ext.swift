//
//  String+Ext.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 22/3/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import UIKit

extension String {
    
    func convertToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = .current
        
        return dateFormatter.date(from: self)
    }
    
    func convertToDisplayFormat() -> String {
        guard let date = self.convertToDate() else { return "N/A" }
        return date.formatToMonthYearFormat()
    }
}
