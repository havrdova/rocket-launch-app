//
//  APIError.swift
//  TCA
//
//  Created by Lucie Havrdová on 06.09.2022.
//

import Foundation

enum APIError: Error {
    case downloadError
    case decodingError
}

extension APIError: Equatable {}
