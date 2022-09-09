//
//  LoadableView.swift
//  TCA
//
//  Created by Lucie Havrdová on 08.09.2022.
//

import SwiftUI
import Combine

// MARK: - Loadable View

struct LoadableView<ErrorView: View,
                    LoadedView: View,
                    LoadingView: View,
                    LoadedValue: Equatable>: View {
    let loadable: Loadable<LoadedValue, APIError>
    let loadingView: () -> LoadingView
    let errorView: (APIError) -> ErrorView
    var loadedView: (LoadedValue) -> LoadedView

    var body: some View {
        switch loadable {
        case .idle, .loading:
            loadingView()

        case .failed(let error):
            errorView(error)

        case .loaded(let loadedData):
            loadedView(loadedData)
        }
    }

}

typealias DefaultProgressView = ProgressView<EmptyView, EmptyView>
typealias DefaultErrorView = CustomErrorView

extension LoadableView where LoadingView == DefaultProgressView, ErrorView == DefaultErrorView {
    init(
        for loadable: Loadable<LoadedValue, APIError>,
        @ViewBuilder loadedView: @escaping (LoadedValue) -> LoadedView
    ) {
        self.init(loadable: loadable) {
            ProgressView()
        } errorView: { error in
            CustomErrorView(title: error.localizedDescription)
        } loadedView: { loadedData in
            loadedView(loadedData)
        }
    }
}
