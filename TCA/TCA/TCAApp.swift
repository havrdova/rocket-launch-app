//
//  TCAApp.swift
//  TCA
//
//  Created by Lucie Havrdová on 19.08.2022.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCAApp: App {
    let store = Store(
        initialState: RocketListState(),
        reducer: rocketListReducer,
        environment: RocketListEnvironment(
            rocketListRequest: getRocketList,
            mainQueue: .main
        )
    )

    var body: some Scene {
        WindowGroup {
            RocketListView(store: store)
        }
    }
}
