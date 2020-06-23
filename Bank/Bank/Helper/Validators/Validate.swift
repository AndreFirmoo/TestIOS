//
//  Validate.swift
//  Bank
//
//  Created by Andre Jardim Firmo on 23/06/20.
//  Copyright © 2020 Andre Jardim Firmo. All rights reserved.
//

import Foundation

struct Validator {
    static func isValid(username: String) -> String? {
        if username.isEmpty { return ErrorType.mandatoryUser.localizedDescription }
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        if !username.matchRegex(emailRegex) && !username.isCPF {
            return ErrorType.invalidUser.localizedDescription
        }
        
        return nil
    }
     static func isValid(password: String) -> String? {
            if password.isEmpty { return ErrorType.mandatoryPassword.localizedDescription }
            let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{3,}"
            if !password.matchRegex(passwordRegex) { return ErrorType.invalidPassword.localizedDescription }
            return nil
    }
}
