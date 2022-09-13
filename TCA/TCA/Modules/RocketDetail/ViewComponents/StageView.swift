//
//  StageView.swift
//  TCA
//
//  Created by Lucie Havrdová on 13.09.2022.
//

import SwiftUI

struct StageView: View {
    let title: String
    let stage: Stage

    var body: some View {
        ShadedBackgroundView {
            VStack(alignment: .leading) {
                Text(title)

                StageItemView(
                    image: Icons.reusable,
                    text: stage.reusable ? "reusable" : "not reusable"
                    // boolString(name: PluralString.reusable.stringValue, value: stage.reusable)
                )
                StageItemView(
                    image: Icons.engine,
                    text: String(stage.engines)
                        // pluralString(name: PluralString.enginesCount.stringValue, count: UInt(stage.engines))
                )
                StageItemView(
                    image: Icons.fuel,
                    text: String(stage.fuelAmount)
                        // pluralString(name: PluralString.fuelAmount.stringValue, count: UInt(stage.fuelAmount))
                )
                if let time = stage.burnTime {
                    StageItemView(
                        image: Icons.burn,
                        text: String(time)
                            // pluralString(name: PluralString.burnTime.stringValue, count: UInt(time))
                    )
                }
            }
        }


    }

}


// MARK: - StageItem View

struct StageItemView: View {
    var spacingInParts: CGFloat = 10

    let image: Icons
    let text: String

    var body: some View {
        HStack(spacing: spacingInParts) {
            image.image
            Text(text)
        }
    }
}

// MARK: StageItemView Preview

struct StageItemView_Previews: PreviewProvider {
    static var previews: some View {
        StageItemView(
            image: Icons.burn,
            text: "Burn"
        )
    }
}
