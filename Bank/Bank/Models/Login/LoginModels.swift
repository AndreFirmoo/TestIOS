//
//  LoginModels.swift
//  Bank
//
//  Created by Andre Jardim Firmo on 23/06/20.
//  Copyright © 2020 Andre Jardim Firmo. All rights reserved.
//


import UIKit

enum Login {
    struct Request {
        let username: String
        let password: String
    }
    struct Response {
        let user: UserMapper?
    }
    
    struct ViewModel {
        
    }
}

