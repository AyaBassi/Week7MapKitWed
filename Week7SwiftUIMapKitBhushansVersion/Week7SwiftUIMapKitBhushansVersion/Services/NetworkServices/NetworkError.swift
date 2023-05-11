//
//  NetworkError.swift
//  Week7SwiftUIMapKitBhushansVersion
//
//  Created by Payam Karbassi on 10/05/2023.
//

import Foundation

enum NetworkError : Error {
    case invalidUrl
    
}

extension NetworkError : LocalizedError{
    var errorDescription: String?{
        switch self{
            
        case .invalidUrl:
            return NSLocalizedString("invalidUrl", comment: <#T##String#>)
        }
    }
}
