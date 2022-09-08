//
//  LoadingState.swift
//  TCA
//
//  Created by Lucie Havrdová on 08.09.2022.
//

import Foundation

// MARK: - Loading State

enum LoadingState<Value> {
    case idle
    case loading
    case failed(Error)
    case loaded(Value)
}
