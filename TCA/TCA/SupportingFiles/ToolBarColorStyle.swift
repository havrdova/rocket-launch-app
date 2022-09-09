//
//  ToolBarColorStyle.swift
//  TCA
//
//  Created by Lucie Havrdová on 09.09.2022.
//

import SwiftUI

func toolBarColor(_ color: UIColor) {
    let coloredAppearance = UINavigationBarAppearance()
    coloredAppearance.configureWithOpaqueBackground()
    coloredAppearance.backgroundColor = color
    coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
    coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]

    UINavigationBar.appearance().standardAppearance = coloredAppearance
    UINavigationBar.appearance().compactAppearance = coloredAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance

    UINavigationBar.appearance().tintColor = .black
}
