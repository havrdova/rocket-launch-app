//
//  LoadableObject.swift
//  TCA
//
//  Created by Lucie Havrdová on 08.09.2022.
//

import Foundation

// MARK: - Loadable Object

protocol LoadableObject: ObservableObject {
    associatedtype Output
    var state: LoadingState<Output> { get }
}
