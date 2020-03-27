//
//  Date+Ext.swift
//  GithubFollowers
//
//  Created by Elias Myronidis on 22/3/20.
//  Copyright © 2020 Elias Myronidis. All rights reserved.
//

import UIKit

extension Date {
    func formatToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        
        return dateFormatter.string(from: self)
    }
}
