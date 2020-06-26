//
//  DateHelper.swift
//  Bank
//
//  Created by Andre Jardim Firmo on 23/06/20.
//  Copyright © 2020 Andre Jardim Firmo. All rights reserved.
//

import Foundation

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = "dd-MM-yyyy"
        dateformat.locale = Locale(identifier: "pt-br")
        dateformat.date(from: format)
        dateformat.dateStyle = .short
        print(format)
        return dateformat.string(from: self)
    }
}
