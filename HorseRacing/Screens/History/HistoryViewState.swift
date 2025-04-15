//
//  HistoryViewState.swift
//  HorseRacing
//
//  Created by Fedorova Maria on 15.04.2025.
//

import SwiftUI

final class HistoryViewState: ObservableObject {
    @Published var winningHorses: [Horse] = []
}
