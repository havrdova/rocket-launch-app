//
//  RocketDetail.swift
//  TCA
//
//  Created by Lucie Havrdová on 07.09.2022.
//

import SwiftUI

// MARK: - Rocket Detail Model

struct RocketDetail: Equatable {
    let id: String
    let name: String
    let description: String

    let parameters: [Parameter]
    let firstStage: Stage
    let secondStage: Stage
    let photos: [Photo]
}

// MARK: Parameter

enum ParameterType {
    case diameter
    case height
    case mass
}

struct Parameter: Equatable {
    let type: ParameterType
    let name: LocalizedStringKey // TODO: implement
    var metric: Double
    let imperial: Double

    var metricString: String {
        switch type {
        case .diameter, .height:
            return String(format: "%.0f", self.metric)+"m"
        case .mass:
            if self.metric.rounded(.down) > 1000 {
                return String(format: "%.0f", self.metric/1000)+"t"
            }
            return String(format: "%.0f", self.metric)+"kg"
        }
    }
}

// MARK: Stage

struct Stage: Equatable {
    let engines: Int
    let reusable: Bool
    let fuelAmount: Int
    let burnTime: Int?
}

// MARK: Photo

struct Photo: Hashable {
    let stringURL: String
}
