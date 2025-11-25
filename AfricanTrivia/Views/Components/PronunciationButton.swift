//
//  PronunciationButton.swift
//  AfricanTrivia
//
//  Created by diayan siat on 25/11/2025.
//

import SwiftUI

struct PronunciationButton: View {
    let text: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: DesignSystem.Spacing.small) {
                Text(text)
                    .font(DesignSystem.Typography.body)
                Image(systemName: "speaker.wave.2.fill")
                    .font(DesignSystem.Typography.caption)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
        }
        .foregroundStyle(.primary)
    }
}
