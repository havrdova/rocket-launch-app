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
    var body: some Scene {
        WindowGroup {
            NavigationView {
                RocketListView(store: Store(
                    initialState: RocketListState(),
                    reducer: rocketListReducer,
                    environment: RocketListEnvironment(rocketListRequest: getRocketListFromMock)
                ))
            }
        }
    }
}
