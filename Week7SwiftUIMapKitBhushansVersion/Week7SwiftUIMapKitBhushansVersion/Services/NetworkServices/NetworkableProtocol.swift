//
//  NetworkableProtocol.swift
//  Week7SwiftUIMapKitBhushansVersion
//
//  Created by Payam Karbassi on 10/05/2023.
//

import Foundation
protocol NetworkableProtocol{
    func getData(urlString:String) async throws
}
