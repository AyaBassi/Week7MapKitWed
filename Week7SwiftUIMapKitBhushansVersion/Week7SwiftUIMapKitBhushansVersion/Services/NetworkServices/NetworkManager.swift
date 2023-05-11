//
//  NetworkManager.swift
//  Week7SwiftUIMapKitBhushansVersion
//
//  Created by Payam Karbassi on 10/05/2023.
//

import Foundation
class NetworkManager : NetworkableProtocol {
    
    func getData(urlString: String) async throws {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidUrl
        }
        
        do {
            let (data , response ) = try await URLSession.shared.data(from: url)
            
        }catch {
            
        }
    }
    
}
