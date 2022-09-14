//
//  RocketLaunchView.swift
//  TCA
//
//  Created by Lucie Havrdová on 13.09.2022.
//

import SwiftUI
import ComposableArchitecture
import ComposableCoreMotion

// MARK: - RocketLauch State

struct RocketLaunchState: Equatable {
    var isLaunched: Bool = false
    var pitch: Double = 0.0
    var roll: Double = 0.0
}

// MARK: - RocketLauch Action

enum RocketLaunchAction: Equatable {
    case motionUpdate(Result<DeviceMotion, NSError>)
    case startMotionManager
    case stopMotionManager
    case launch
}

// MARK: - Rocket Launch View

struct RocketLaunchView: View {
    @ObservedObject var viewStore: ViewStore<RocketLaunchState, RocketLaunchAction>
    let store: Store<RocketLaunchState, RocketLaunchAction>

    init(store: Store<RocketLaunchState, RocketLaunchAction>) {
        self.store = store
        self.viewStore = ViewStore(store)
    }

    var body: some View {
        VStack {
            Text(String(format: "pitch: %.1f", viewStore.pitch))
            Text(String(format: "roll: %.1f", viewStore.roll))
        }
        .navigationTitle(.RocketLaunch.title)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear{ viewStore.send(.startMotionManager) }
        .onDisappear{ viewStore.send(.stopMotionManager) }
    }
}

// MARK: RocketLaunchView Preview

struct RocketLaunchView_Previews: PreviewProvider {
    static var previews: some View {
        RocketLaunchView(store: Store(
            initialState: RocketLaunchState(),
            reducer: rocketLaunchReducer,
            environment: RocketLaunchEnvironment(motionManager: .live)
        ))
    }
}
