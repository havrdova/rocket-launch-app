//
//  ShadedBackgroundView.swift
//  TCA
//
//  Created by Lucie Havrdová on 13.09.2022.
//

import SwiftUI

struct ShadedBackgroundView<Content: View>: View {
    let content: () -> Content

    var body: some View {
        content()
            .background(.gray)
    }
}
