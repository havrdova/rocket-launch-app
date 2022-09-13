//
//  RocketDetailManager.swift
//  TCA
//
//  Created by Lucie Havrdová on 07.09.2022.
//

import ComposableArchitecture
import Foundation

// MARK: - RocketDetail data providers

func getRocketDetail(id: String) -> Effect<RocketDetail, APIError> {
    guard let url = URL(string: "https://api.spacexdata.com/v4/rockets/\(id)") else {
        fatalError("Error on creating url")
    }

    return URLSession.shared.dataTaskPublisher(for: url)
        .mapError{ _ in APIError.downloadError }
        .map{ data, _ in data }
        .decode(type: RocketDetailDTO.self, decoder: JSONDecoder())
        .mapError{ _ in APIError.decodingError }
        .map{ $0.toModel }
        .mapError{ _ in APIError.mapingDTOError }
        .eraseToEffect()
    
//    // TODO: implement
//    return Effect(value: RocketDetail.falcon9)
}

func getRocketDetailFromMock(id: String) -> Effect<RocketDetail, APIError> {
    return Effect(value: RocketDetail.falcon9)
}
