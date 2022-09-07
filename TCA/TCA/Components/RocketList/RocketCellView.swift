//
//  RocketCellView.swift
//  TCA
//
//  Created by Lucie Havrdová on 07.09.2022.
//

import SwiftUI

// MARK: - Rocket Cell View

struct RocketCellView: View {
    var rocket: Rocket

    var body: some View {
        HStack {
            Icons.rocket.image

            VStack(alignment: .leading) {
                Text(rocket.name)
                    .font(.headline)
                Text(.RocketList.firstFlight(date: rocket.firstFlight))
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

// MARK: - Rocket Cell Preview

struct RocketCellView_Previews: PreviewProvider {
    static var previews: some View {
        RocketCellView(rocket: Rocket.falcon1)
    }
}
