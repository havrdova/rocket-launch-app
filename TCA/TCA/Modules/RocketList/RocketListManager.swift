//
//  RocketListEffect.swift
//  TCA
//
//  Created by Lucie Havrdová on 06.09.2022.
//

import ComposableArchitecture

// MARK: - Rocket providers

func getRocketList() -> Effect<[Rocket], APIError> {
    // TODO: implement
    return Effect(value: [])
}

func getRocketListFromMock() -> Effect<[Rocket], APIError> {
    return Effect(value: Rocket.all)
}
