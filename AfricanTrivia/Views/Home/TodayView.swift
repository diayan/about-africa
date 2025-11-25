//
//  TodayView.swift
//  AfricanTrivia
//
//  Created by diayan siat on 22/11/2025.
//

import SwiftUI

struct TodayView: View {
    @Environment(\.colorScheme) private var colorScheme
    @State private var dailyContent = MockData.mockDailyContent
    @State private var currentFactIndex: Int? = 0
    @State private var savedFacts: Set<String> = []
    @State private var lovedFacts: Set<String> = []

    var body: some View {
        ZStack {
            DesignSystem.Colors.adaptiveBackground(for: colorScheme)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                ProgressIndicator(
                    currentIndex: currentFactIndex ?? 0,
                    totalCount: dailyContent.facts.count
                )

                GeometryReader { geometry in
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack(spacing: 0) {
                            ForEach(Array(dailyContent.facts.enumerated()), id: \.element.id) { index, fact in
                                FactPageView(
                                    fact: fact,
                                    isSaved: savedFacts.contains(fact.id),
                                    isLoved: lovedFacts.contains(fact.id),
                                    onSave: { toggleSaved(fact.id) },
                                    onLove: { toggleLoved(fact.id) }
                                )
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .id(index)
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.paging)
                    .scrollPosition(id: $currentFactIndex)
                }
            }
        }
    }

    private func toggleSaved(_ factID: String) {
        if savedFacts.contains(factID) {
            savedFacts.remove(factID)
        } else {
            savedFacts.insert(factID)
        }
    }

    private func toggleLoved(_ factID: String) {
        if lovedFacts.contains(factID) {
            lovedFacts.remove(factID)
        } else {
            lovedFacts.insert(factID)
        }
    }
}

#Preview {
    TodayView()
}
