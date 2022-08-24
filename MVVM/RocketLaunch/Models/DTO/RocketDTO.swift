//
//  RocketDTO.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 19.08.2022.
//

import Foundation

// MARK: - Rocket DTO Model

struct RocketDTO {
    let id: String
    let name: String
    let first_flight: String
}

// MARK: toRocket (DTO into Model)

extension RocketDTO {
    var toRocket: Rocket {
        Rocket(
            id: self.id,
            name: self.name,
            firstFlight: createDate(self.first_flight, stringFormat: "yyyy-MM-dd")
        )
    }
}
