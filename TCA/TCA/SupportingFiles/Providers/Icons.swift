//
//  Icons.swift
//  TCA
//
//  Created by Lucie Havrdová on 07.09.2022.
//

import SwiftUI

// MARK: - Icons Provider

enum Icons: String {
    case burn = "Burn"
    case engine = "Engine"
    case fuel = "Fuel"
    case reusable = "Reusable"
    case flyingRocket = "Rocket Flying"
    case idleRocket = "Rocket Idle"
    case rocket = "Rocket"
    case placeholder = "Placeholder"

    var image: Image {
        Image(self.rawValue)
    }
}