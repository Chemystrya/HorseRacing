//
//  HistoryViewModel.swift
//  HorseRacing
//
//  Created by Fedorova Maria on 15.04.2025.
//

protocol HistoryViewModel: AnyObject {
    func cleanHistory()
}

final class HistoryViewModelImpl {
    private let viewState: HistoryViewState

    init(viewState: HistoryViewState) {
        self.viewState = viewState
    }
}

extension HistoryViewModelImpl: HistoryViewModel {
    func cleanHistory() {
        viewState.winningHorses = []
    }
}
