//
//  RocketDetailReducer.swift
//  TCA
//
//  Created by Lucie Havrdová on 07.09.2022.
//

import Foundation
import ComposableArchitecture

// MARK: - RocketDetail Environment

struct RocketDetailEnvironment {
    var rocketDetailRequest: (String) -> Effect<RocketDetail, APIError>
}

// MARK: - RocketDetail Reducer

let rocketDetailReducer = Reducer<
    RocketDetailState,
    RocketDetailAction,
    RocketDetailEnvironment
> { state, action, environment in
    switch action {
    case .onAppear:
        return environment.rocketDetailRequest(state.id)
            .receive(on: DispatchQueue.main)
            .catchToEffect()
            .map(RocketDetailAction.dataLoaded)

    case .dataLoaded(let result):
        switch result {
        case .success(let rocket):
            state.rocket = rocket
        case .failure(let error):
            break
        }
        return .none
    }

}
