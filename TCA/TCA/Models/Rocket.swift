//
//  Rocket.swift
//  TCA
//
//  Created by Lucie Havrdová on 06.09.2022.
//

import Foundation

struct Rocket: Identifiable, Codable, Equatable {
    let id: String
    let name: String
    let firstFlight: Date
}
