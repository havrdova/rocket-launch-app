//
//  RocketDetailView.swift
//  TCA
//
//  Created by Lucie Havrdová on 07.09.2022.
//

import SwiftUI
import ComposableArchitecture

// MARK: - Rocket Detail View

struct RocketDetailView: View {
    let store: Store<RocketDetailState, RocketDetailAction>

    var body: some View {
        WithViewStore(self.store) { store in
            if let rocket = store.rocket {
                content(rocket: rocket)
                    .onAppear{
                        store.send(.onAppear)
                    }
                    .navigationTitle(store.rocket?.name ?? "noName")
            } else {
                Text("Loading")
            }
        }
    }

    func content(rocket: RocketDetail) -> some View {
        Text(rocket.name)
    }
}

// MARK: RocketDetailView Preview

struct RocketDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RocketDetailView(store: Store(
            initialState: RocketDetailState(id: RocketDetail.falcon9.id),
            reducer: rocketDetailReducer,
            environment: RocketDetailEnvironment(rocketDetailRequest: getRocketDetailFromMock)
        ))
    }
}
