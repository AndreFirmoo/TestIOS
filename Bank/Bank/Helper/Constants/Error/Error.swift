//
//  Error.swift
//  Bank
//
//  Created by Andre Jardim Firmo on 23/06/20.
//  Copyright © 2020 Andre Jardim Firmo. All rights reserved.
//

import Foundation

struct Errors {
    struct Error {
        static let mandatoryUser = "O Usuario é obrigatorio"
        static let mandatoryPassword = "A Senha é obrigatorio"
        static let invalidUser = "usuario Invalido"
        static let invalidPassword = "Senha Invalida"
    }
}

enum ErrorType: Error {
    case mandatoryUser
    case mandatoryPassword
    case invalidUser
    case invalidPassword
}

extension ErrorType: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .mandatoryUser: return Errors.Error.mandatoryUser
        case .invalidUser: return Errors.Error.invalidUser
        case .mandatoryPassword: return Errors.Error.mandatoryPassword
        case .invalidPassword: return Errors.Error.invalidPassword
        }
    }
}
