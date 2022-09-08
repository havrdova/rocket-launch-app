import SwiftUI
import ComposableArchitecture

// MARK: - RocketList State

struct RocketListState: Equatable {
    var rockets: [Rocket] = []
}

// MARK: - RocketList Action

enum RocketListAction: Equatable {
    case onAppear
    case dataLoaded(Result<[Rocket], APIError>)
}

// MARK: - RocketList View

struct RocketListView: View {
    let store: Store<RocketListState, RocketListAction>

    var body: some View {
        WithViewStore(self.store) { store in
            content(rockets: store.rockets)
                .onAppear{
                    store.send(.onAppear)
                }
                .navigationTitle(.RocketList.title)
        }
    }

    func content(rockets: [Rocket]) -> some View {
        List {
            ForEach(rockets) { rocket in
                NavigationLink {
                    RocketDetailView(store: Store(
                        initialState: RocketDetailState(id: rocket.id),
                        reducer: rocketDetailReducer,
                        environment: RocketDetailEnvironment(rocketDetailRequest: getRocketDetailFromMock))
                    )
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
