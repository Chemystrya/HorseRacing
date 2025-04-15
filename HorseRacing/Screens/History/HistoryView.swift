//
//  HistoryView.swift
//  HorseRacing
//
//  Created by Fedorova Maria on 15.04.2025.
//

import SwiftUI

struct HistoryView: View {
    @ObservedObject private var viewState: HistoryViewState

    private let viewModel: HistoryViewModel

    init(viewState: HistoryViewState, viewModel: HistoryViewModel) {
        _viewState = ObservedObject(wrappedValue: viewState)
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    LazyVStack {
                        if viewState.winningHorses.isEmpty {
                            Text("Нет данных")
                                .foregroundColor(.gray)
                        } else {
                            ForEach(Array(viewState.winningHorses.enumerated()), id: \.offset) { (index, horse) in
                                Text("Победила лошадь \(horse.id)")
                            }
                        }
                    }
                }
                
                VStack {
                    Spacer()
                    BottomButton(text: "Очистить историю", color: .red) {
                        viewModel.cleanHistory()
                    }
                    .padding(16)
                }
            }
            .navigationTitle("История")
        }
    }
}

