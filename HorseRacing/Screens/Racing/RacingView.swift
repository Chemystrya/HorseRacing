//
//  RacingView.swift
//  HorseRacing
//
//  Created by Fedorova Maria on 15.04.2025.
//

import SwiftUI

struct RacingView: View {
    @ObservedObject private var viewState: RacingViewState

    private let viewModel: RacingViewModel

    init(viewState: RacingViewState, viewModel: RacingViewModel) {
        _viewState = ObservedObject(wrappedValue: viewState)
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            Text("Лошадиные скачки 🐎")
                .font(.title)
                .padding()

            Spacer()

            ForEach(viewState.horses, id: \.id) { horse in
                HorseProgressView(horse: horse)
            }

            Spacer()

            if viewState.isRunning {
                BottomButton(text: "Остановить", color: .red) {
                    viewModel.stopRace()
                }
            } else {
                BottomButton(text: "Старт", color: .blue) {
                    viewModel.startRace()
                }
            }
        }
        .padding()
    }
}

private struct HorseProgressView: View {
    private let horse: Horse

    init(horse: Horse) {
        self.horse = horse
    }

    var body: some View {
        HStack {
            Text("Лошадь \(horse.id)")
                .frame(width: 80, alignment: .leading)

            ProgressView(value: horse.currentPosition, total: 1)
                .progressViewStyle(LinearProgressViewStyle())
                .tint(horse.currentPosition >= 1 ? Color.green : Color.blue)
                .frame(height: 20)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(10)
        }
        .padding(.vertical, 4)
    }
}
