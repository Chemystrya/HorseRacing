//
//  RacingViewModel.swift
//  HorseRacing
//
//  Created by Fedorova Maria on 15.04.2025.
//

import SwiftUI

@MainActor
protocol RacingViewModel {
    func startRace()
    func stopRace()
}

final class RacingViewModelImpl {
    private let viewState: RacingViewState
    private let historyViewState: HistoryViewState
    private let model: RacingModel

    init(
        viewState: RacingViewState,
        historyViewState: HistoryViewState,
        model: RacingModel
    ) {
        self.viewState = viewState
        self.historyViewState = historyViewState
        self.model = model
    }
}

// MARK: - RacingViewModel
extension RacingViewModelImpl: RacingViewModel {
    func startRace() {
        guard !viewState.isRunning else { return }

        Task {
            viewState.isRunning = true
            resetHorsesPositions()

            while viewState.isRunning {
                let horses = await model.runHorseRacing(horses: viewState.horses)

                for horse in horses {
                    guard let index = viewState.horses.firstIndex(where: { $0.id == horse.id }) else { return }

                    viewState.horses[index].currentPosition = horse.currentPosition
                }

                if let winningHorse = viewState.horses.first(where: { $0.currentPosition >= 1 }) {
                    viewState.isRunning = false
                    historyViewState.winningHorses.insert(winningHorse, at: 0)
                }
            }
        }
    }

    func stopRace() {
        viewState.isRunning = false
    }
}

// MARK: - Private Methods
extension RacingViewModelImpl {
    private func resetHorsesPositions() {
        viewState.horses = [
            Horse(id: 1, currentPosition: 0),
            Horse(id: 2, currentPosition: 0),
            Horse(id: 3, currentPosition: 0),
            Horse(id: 4, currentPosition: 0),
            Horse(id: 5, currentPosition: 0)
        ]
    }
}
