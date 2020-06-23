//
//  API.swift
//  Bank
//
//  Created by Andre Jardim Firmo on 23/06/20.
//  Copyright © 2020 Andre Jardim Firmo. All rights reserved.
//

import Foundation
import Alamofire

struct LoginParams:Encodable {
    let user: String
    let password: String
}

enum API: URLRequestConvertible {
    case login(username: String, password: String)
    case home(userId: String)
    
    private var method: HTTPMethod{
        switch self {
            case .login: return .post
            case .home: return .get
        }
    }
    
    private var path: String {
        switch self {
            case .login: return Urls.Service.login
            case.home(let userId): return "\(Urls.Service.home)\(userId)"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let url = try Urls.Service.base.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(JsonConstant.Json.json, forHTTPHeaderField: JsonConstant.Json.contentType)
        
        switch self {
            case .login(let userName, let password):
                let params: LoginParams = LoginParams(user: userName, password: password)
                urlRequest = try URLEncodedFormParameterEncoder.default.encode(params, into: urlRequest)
            case .home(let userId): break
            
        }
        
        return urlRequest
        
    }
    
    
}
