//
//  TabbarView.swift
//  HorseRacing
//
//  Created by Fedorova Maria on 15.04.2025.
//

import SwiftUI

struct TabbarView: View {
    private let historyViewState = HistoryViewState()

    var body: some View {
        TabView {
            RacingAssembly.assemble(with: historyViewState)
                .tabItem {
                    Label("Скачки", systemImage: "flag.filled.and.flag.crossed")
                }

            HistoryAssembly.assemble(with: historyViewState)
                .tabItem {
                    Label("История", systemImage: "clock.arrow.circlepath")
                }
        }
    }
}
