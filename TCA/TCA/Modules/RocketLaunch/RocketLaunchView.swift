//
//  RocketLaunchView.swift
//  TCA
//
//  Created by Lucie Havrdová on 13.09.2022.
//

import SwiftUI
import ComposableArchitecture

// MARK: - RocketLauch State

struct RocketLaunchState: Equatable {

}

// MARK: - RocketLauch Action

enum RocketLaunchAction: Equatable {

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
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .navigationTitle(.RocketLaunch.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: RocketLaunchView Preview

struct RocketLaunchView_Previews: PreviewProvider {
    static var previews: some View {
        RocketLaunchView(store: Store(
            initialState: RocketLaunchState(),
            reducer: rocketLaunchReducer,
            environment: RocketLaunchEnvironment()
        ))
    }
}
