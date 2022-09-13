//
//  DTOModelProtocol.swift
//  TCA
//
//  Created by Lucie Havrdová on 13.09.2022.
//

import Foundation

// MARK: - DTO Model Protocol

protocol DTOModelProtocol {
    associatedtype T

    var toModel: T { get }
}
