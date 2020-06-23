//
//  HomeModels.swift
//  Bank
//
//  Created by Andre Jardim Firmo on 23/06/20.
//  Copyright © 2020 Andre Jardim Firmo. All rights reserved.
//

import UIKit

enum Home {
  // MARK: Use cases
    struct Request {
        let userId: String
    }
    
    struct Response {
        let statementsList: StatementList?
        let user: UserRealm?
        let error: String?
    }
    
    struct ViewModel {
        let response: Response
    }
}
