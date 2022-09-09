//
//  RocketListReducer.swift
//  TCA
//
//  Created by Lucie Havrdová on 06.09.2022.
//

import CombineSchedulers
import ComposableArchitecture
import Dispatch

// MARK: - RocketList Environment

struct RocketListEnvironment {
    var rocketListRequest: () -> Effect<[Rocket], APIError>
    var mainQueue: AnySchedulerOf<DispatchQueue>
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
            .receive(on: environment.mainQueue)
            .catchToEffect(RocketListAction.dataLoaded)

    case .dataLoaded(let result):
        switch result {
        case .success(let rockets):
            state.rockets = .loaded(rockets)
        case .failure(let error):
            state.rockets = .failed(error)
        }
        return .none
    }
}
