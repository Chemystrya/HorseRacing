//
//  HistoryAssembly.swift
//  HorseRacing
//
//  Created by Fedorova Maria on 15.04.2025.
//

import SwiftUI

enum HistoryAssembly {
    static func assemble(with historyViewState: HistoryViewState) -> some View {
        let viewModel = HistoryViewModelImpl(viewState: historyViewState)
        let view = HistoryView(viewState: historyViewState, viewModel: viewModel)

        return view
    }
}
