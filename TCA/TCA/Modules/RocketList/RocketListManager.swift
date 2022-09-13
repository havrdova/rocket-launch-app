//
//  RocketListEffect.swift
//  TCA
//
//  Created by Lucie Havrdová on 06.09.2022.
//

import ComposableArchitecture
import Foundation

// MARK: - Rocket providers

func getRocketList() -> Effect<[Rocket], APIError> {
    guard let url = URL(string: "https://api.spacexdata.com/v4/rockets/") else {
      fatalError("Error on creating url")
    }
    return URLSession.shared.dataTaskPublisher(for: url)
        .mapError{ _ in APIError.downloadError }
        .map{ data, _ in data }
        .decode(type: [RocketDTO].self, decoder: JSONDecoder())
        .mapError{ _ in APIError.decodingError }
        .map{ data in
            var array: [Rocket] = []
            for dtoRocket in data {
                array.append(dtoRocket.toModel)
            }
            return array
        }
        .mapError{ _ in APIError.mapingDTOError }
        .eraseToEffect()
}

func getRocketListFromMock() -> Effect<[Rocket], APIError> {
    return Effect(value: Rocket.all)
}
