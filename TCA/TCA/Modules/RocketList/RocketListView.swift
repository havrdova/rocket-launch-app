//
//  RocketListView.swift
//  TCA
//
//  Created by Lucie Havrdová on 06.09.2022.
//

import SwiftUI
import ComposableArchitecture

// MARK: - RocketList View

struct RocketListView: View {
    let store: Store<RocketListState, RocketListAction>

    var body: some View {
        WithViewStore(self.store) { store in
            listView(rockets: store.rockets)
                .onAppear{
                    store.send(.onAppear)
                }
                .navigationTitle(.RocketList.title)
        }
    }

    func listView(rockets: [Rocket]) -> some View {
        List {
            ForEach(rockets) { rocket in
                NavigationLink {
                    RocketDetailView()
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
            environment: RocketListEnvironment(rocketListRequest: getRocketListFromMock)
        ))
    }
}
