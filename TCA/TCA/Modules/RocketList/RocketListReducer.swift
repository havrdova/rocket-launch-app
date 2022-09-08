//
//  RocketListReducer.swift
//  TCA
//
//  Created by Lucie Havrdová on 06.09.2022.
//

import ComposableArchitecture
import Dispatch

// MARK: - RocketList Environment

struct RocketListEnvironment {
    var rocketListRequest: () -> Effect<[Rocket], APIError>
}

// MARK: - RocketList Reducer

let rocketListReducer = Reducer<
    RocketListState,
    RocketListAction,
    RocketListEnvironment
> { state, action, environment in
    switch action {
    case .onAppear:
        return environment.rocketListRequest()
            .receive(on: DispatchQueue.main )
            .catchToEffect()
            .map(RocketListAction.dataLoaded)

    case .dataLoaded(let result):
        switch result {
        case .success(let rockets):
            state.rockets = rockets
        case .failure(let error):
            break
        }
        return .none
    }
}
