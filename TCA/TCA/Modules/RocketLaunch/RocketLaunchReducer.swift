//
//  RocketLaunchReducer.swift
//  TCA
//
//  Created by Lucie Havrdová on 13.09.2022.
//

import Foundation
import ComposableArchitecture

// MARK: - RocketLaunch Environment

struct RocketLaunchEnvironment {

}

// MARK: - RocketLaunch Reducer

let rocketLaunchReducer = Reducer<
    RocketLaunchState,
    RocketLaunchAction,
    RocketLaunchEnvironment
> { state, action, environment in
    return .none
}

