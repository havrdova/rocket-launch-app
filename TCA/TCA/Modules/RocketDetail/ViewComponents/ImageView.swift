//
//  ImageView.swift
//  TCA
//
//  Created by Lucie Havrdová on 13.09.2022.
//

import SwiftUI

// MARK: - Image View

struct ImageView: View {
    let url: URL

    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
        } placeholder: {
            Icons.placeholder.image
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
        }
    }
}

// MARK: ImageView Preview

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: URL(string: "https://imgur.com/DaCfMsj.jpg")!)
    }
}
