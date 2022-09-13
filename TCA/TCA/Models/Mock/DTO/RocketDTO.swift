//
//  RocketDTO.swift
//  TCA
//
//  Created by Lucie Havrdová on 13.09.2022.
//

import Foundation

// MARK: - Rocket DTO Model

struct RocketDTO: Codable {
    let id: String
    let name: String
    let first_flight: String
}

// MARK: toRocket (DTO into Model)

extension RocketDTO: DTOModelProtocol {
    var toModel: Rocket {
        Rocket(
            id: self.id,
            name: self.name,
            firstFlight: createDate(self.first_flight, stringFormat: "yyyy-MM-dd")
        )
    }
}
