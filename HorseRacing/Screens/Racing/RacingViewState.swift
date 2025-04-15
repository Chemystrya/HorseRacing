//
//  RacingViewState.swift
//  HorseRacing
//
//  Created by Fedorova Maria on 15.04.2025.
//

import SwiftUI

final class RacingViewState: ObservableObject {
    @Published var horses: [Horse] = [
        Horse(id: 1, currentPosition: 0),
        Horse(id: 2, currentPosition: 0),
        Horse(id: 3, currentPosition: 0),
        Horse(id: 4, currentPosition: 0),
        Horse(id: 5, currentPosition: 0)
    ]
    @Published var isRunning = false
}
