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

        toolBarColor(.lightGray)
    }

    var body: some View {
        LoadableView(for: viewStore.rocket) { rocket in
            loadedView(rocket: rocket)
        }
        .onAppear{
            viewStore.send(.onAppear)
        }
    }

    func loadedView(rocket: RocketDetail) -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                TitledSection(title: .RocketDetail.overviewTitle) {
                    Text(rocket.description)
                }

                TitledSection(title: .RocketDetail.Parameters.title) {
                    Text("3 squares here")
                }

                StageView(
                    title: "First stage",
                    stage: rocket.firstStage
                )

                StageView(
                    title: "Second stage",
                    stage: rocket.secondStage
                )

                imagesPart(rocket: rocket)
            }
            .padding(.horizontal)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(rocket.name)
                        .font(.headline)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(.RocketDetail.launch) {
                        RocketLaunchView(store: Store(
                            initialState: RocketLaunchState(),
                            reducer: rocketLaunchReducer,
                            environment: RocketLaunchEnvironment()
                        ))
                    }
                }
            }
        }
    }

    private func imagesPart(rocket: RocketDetail) -> some View {
        TitledSection(title: .RocketDetail.photosTitle) {
            ForEach(rocket.photos, id: \.self) {
                if let url = URL(string: $0.stringURL) {
                    ImageView(url: url)
                }
            }
        }
    }
}

// MARK: RocketDetailView Preview

struct RocketDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RocketDetailView(store: Store(
            initialState: RocketDetailState(id: RocketDetail.falcon9.id),
            reducer: rocketDetailReducer,
            environment: RocketDetailEnvironment(
                rocketDetailRequest: getRocketDetailFromMock,
                mainQueue: .main
            )
        ))
    }
}
