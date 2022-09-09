//
//  RocketDetailView.swift
//  TCA
//
//  Created by Lucie Havrdová on 07.09.2022.
//

import SwiftUI
import ComposableArchitecture

// MARK: - RocketDetail State

struct RocketDetailState: Equatable {
    let id: String
    var rocket: Loadable<RocketDetail, APIError> = .idle
}

// MARK: - RocketDetail Action

enum RocketDetailAction: Equatable {
    case onAppear
    case dataLoaded(Result<RocketDetail, APIError>)
}

// MARK: - Rocket Detail View

struct RocketDetailView: View {
    @ObservedObject var viewStore: ViewStore<RocketDetailState, RocketDetailAction>
    let store: Store<RocketDetailState, RocketDetailAction>

    init(store: Store<RocketDetailState, RocketDetailAction>) {
        self.store = store
        self.viewStore = ViewStore(store)
    }

    var body: some View {
        EmptyView()
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
