//
//  RocketLaunchReducer.swift
//  TCA
//
//  Created by Lucie Havrdová on 13.09.2022.
//

import ComposableArchitecture
import ComposableCoreMotion

// MARK: - RocketLaunch Environment

struct RocketLaunchEnvironment {
    var motionManager: MotionManager
}

// MARK: - RocketLaunch Reducer

let rocketLaunchReducer = Reducer<
    RocketLaunchState,
    RocketLaunchAction,
    RocketLaunchEnvironment
> { state, action, environment in
    struct MotionManagerId: Hashable {}

    switch action {
    // MARK: Start Motion analizer
    case .startMotionManager:
        return .concatenate(
            environment.motionManager
                .create(id: MotionManagerId())
                .fireAndForget(),
            environment.motionManager
                .startDeviceMotionUpdates(id: MotionManagerId(), using: .xArbitraryCorrectedZVertical, to: .main)
                .mapError{ $0 as NSError }
                .catchToEffect()
                .map(RocketLaunchAction.motionUpdate)
        )

    // MARK: Stop Motion analizer
    case .stopMotionManager:
        return .concatenate(
            environment.motionManager
                .stopDeviceMotionUpdates(id: MotionManagerId())
                .fireAndForget(),
            environment.motionManager
                .destroy(id: MotionManagerId())
                .fireAndForget()
        )

    // MARK: Motion updates
    case let .motionUpdate(.success(deviceMotion)):
        state.pitch = deviceMotion.attitude.pitch
        state.roll = deviceMotion.attitude.roll
        return .none

    case let .motionUpdate(.failure(error)):
        return .none

    // MARK: Launch rocket
    case .launch:
        state.isLaunched = true
        return .none
    }

}
