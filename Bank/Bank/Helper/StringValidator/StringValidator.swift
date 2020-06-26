//
//  StringValidator.swift
//  Bank
//
//  Created by Andre Jardim Firmo on 23/06/20.
//  Copyright © 2020 Andre Jardim Firmo. All rights reserved.
//

import Foundation


extension String {
    func matchRegex(_ regex: String) -> Bool {
        let testString = NSPredicate(format: "SELF MATCHES %@", regex)
        return testString.evaluate(with: self)
    }
}

extension String {
    var isCPF: Bool {
        let CPF = self.onlyNumbers()
        guard CPF.count == 11 else { return false }
        
        let i1 = CPF.index(CPF.startIndex, offsetBy: 9)
        let i2 = CPF.index(CPF.startIndex, offsetBy: 10)
        let i3 = CPF.index(CPF.startIndex, offsetBy: 11)
        let d1 = Int(CPF[i1..<i2])
        let d2 = Int(CPF[i2..<i3])
        
        var temp1 = 0, temp2 = 0
        
        for i in 0...8 {
            let start = CPF.index(CPF.startIndex, offsetBy: i)
            let end = CPF.index(CPF.startIndex, offsetBy: i+1)
            let char = Int(CPF[start..<end])
            
            temp1 += char! * (10 - i)
            temp2 += char! * (11 - i)
        }
        
        temp1 %= 11
        temp1 = temp1 < 2 ? 0 : 11-temp1
        
        temp2 += temp1 * 2
        temp2 %= 11
        temp2 = temp2 < 2 ? 0 : 11-temp2
        
        return temp1 == d1 && temp2 == d2
    }
    
    func onlyNumbers() -> String {
        guard !isEmpty else { return "" }
        return replacingOccurrences(of: "\\D",
                                    with: "",
                                    options: .regularExpression,
                                    range: startIndex..<endIndex)
    }
}
