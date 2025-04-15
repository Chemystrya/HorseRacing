//
//  RacingAssembly.swift
//  HorseRacing
//
//  Created by Fedorova Maria on 15.04.2025.
//

import SwiftUI

enum RacingAssembly {
    static func assemble(with historyViewState: HistoryViewState) -> some View {
        let racingModel = RacingModelImpl()
        let viewState = RacingViewState()
        let viewModel = RacingViewModelImpl(viewState: viewState, historyViewState: historyViewState, model: racingModel)
        let view = RacingView(viewState: viewState, viewModel: viewModel)

        return view
    }
}
