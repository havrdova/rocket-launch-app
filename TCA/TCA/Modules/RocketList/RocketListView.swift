//
//  RocketListView.swift
//  TCA
//
//  Created by Lucie Havrdová on 06.09.2022.
//

import SwiftUI
import ComposableArchitecture

// MARK: - RocketList State

struct RocketListState: Equatable {
    var rockets: Loadable<[Rocket], APIError> = .idle
}

// MARK: - RocketList Action

enum RocketListAction: Equatable {
    case onAppear
    case dataLoaded(Result<[Rocket], APIError>)
}

// MARK: - RocketList View

struct RocketListView: View {
    @ObservedObject var viewStore: ViewStore<RocketListState, RocketListAction>
    let store: Store<RocketListState, RocketListAction>

    init(store: Store<RocketListState, RocketListAction>) {
        self.store = store
        self.viewStore = ViewStore(store)
    }

    var body: some View {
        NavigationView {
            LoadableView(for: viewStore.rockets) { rockets in
                loadedView(rockets: rockets)
            }
            .navigationTitle(.RocketList.title)
        }
        .onAppear{
            viewStore.send(.onAppear)
        }

    }

    func loadedView(rockets: [Rocket]) -> some View {
        List {
            ForEach(rockets) { rocket in
                NavigationLink {
                    let store = Store(
                        initialState: RocketDetailState(id: rocket.id),
                        reducer: rocketDetailReducer,
                        environment: RocketDetailEnvironment(
                            rocketDetailRequest: getRocketDetail,
                            mainQueue: .main
                        )
                    )
                    RocketDetailView(store: store)
                } label: {
                    RocketCellView(rocket: rocket)
                }
            }
        }
    }
}

// MARK: RocketList Preview

struct RocketListView_Previews: PreviewProvider {
    static var previews: some View {
        RocketListView(store: Store(
            initialState: RocketListState(),
            reducer: rocketListReducer,
            environment: RocketListEnvironment(rocketListRequest: getRocketListFromMock, mainQueue: .main)
        ))
    }
}
