//
//  RocketListFeature.swift
//  TCA
//
//  Created by Lucie Havrdová on 06.09.2022.
//

import ComposableArchitecture

// MARK: - RocketList State

struct RocketListState: Equatable {

}

// MARK: - RocketList Action

enum RocketListAction: Equatable {

}

// MARK: - RocketList Environment

struct RocketListEnvironment {

}

// MARK: - RocketList Reducer

let rocketListReducer = Reducer<
    RocketListState,
    RocketListAction,
    RocketListEnvironment
> { state, action, environment in
    return .none
}
