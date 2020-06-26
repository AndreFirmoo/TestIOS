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
        let priceFormatter = NumberFormatter()
        priceFormatter.usesGroupingSeparator = true
        priceFormatter.numberStyle = .currency
        
        priceFormatter.locale = Locale(identifier: "pt_BR")
        return priceFormatter.string(from: NSNumber(value: price)) ?? ""
    }
}
