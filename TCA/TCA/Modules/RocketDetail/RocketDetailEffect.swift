//
//  RocketDetailEffect.swift
//  TCA
//
//  Created by Lucie Havrdová on 07.09.2022.
//

import ComposableArchitecture

// MARK: - RocketDetail data providers

func getRocketDetail(id: Int) -> Effect<RocketDetail, APIError> {
    // TODO: implement
    return Effect(value: RocketDetail.falcon9)
}

func getRocketDetailFromMock(id: Int) -> Effect<RocketDetail, APIError> {
    return Effect(value: RocketDetail.falcon9)
}
