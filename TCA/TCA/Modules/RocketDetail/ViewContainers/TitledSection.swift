//
//  TitledSection.swift
//  TCA
//
//  Created by Lucie Havrdová on 13.09.2022.
//

import Foundation
import SwiftUI

struct TitledSection<Content: View>: View {
    let title: LocalizedStringKey
    let content: () -> Content

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
            content()
        }
    }
}
