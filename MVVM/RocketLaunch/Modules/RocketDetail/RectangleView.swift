//
//  RectangleView.swift
//  RocketLaunch
//
//  Created by Lucie Havrdová on 23.08.2022.
//

import SwiftUI

// MARK: - Rectangle View

struct RectangleView: View {
    private let squareSize: CGFloat = 100

    let textTop: String
    let textBottom: LocalizedStringKey

    var body: some View {
        Rectangle()
            .fill(.pink)
            .overlay(
                VStack {
                    Text(textTop)
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(textBottom)
                        .font(.caption)
                        .foregroundColor(.white)
                }
            )
            .frame(height: squareSize, alignment: .center)
            .cornerRadius(Constants.View.cornerRadius)
    }
}

// MARK: RectangleView Preview

struct RectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleView(
            textTop: "50m",
            textBottom: "výška"
        )
    }
}
