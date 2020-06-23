//
//  PriceHelper.swift
//  Bank
//
//  Created by Andre Jardim Firmo on 23/06/20.
//  Copyright © 2020 Andre Jardim Firmo. All rights reserved.
//

import Foundation

struct PriceHelper {
    static func formatPrice(price: Double) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        
        currencyFormatter.locale = Locale(identifier: "pt_BR")
        return currencyFormatter.string(from: NSNumber(value: price)) ?? ""
    }
}
