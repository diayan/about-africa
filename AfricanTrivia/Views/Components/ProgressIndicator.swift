//
//  ProgressIndicator.swift
//  AfricanTrivia
//
//  Created by diayan siat on 25/11/2025.
//

import SwiftUI

struct ProgressIndicator: View {
    let currentIndex: Int
    let totalCount: Int

    var body: some View {
        HStack {
            Spacer()

            HStack(spacing: DesignSystem.Spacing.small) {
                Image(systemName: "bookmark.fill")
                    .font(DesignSystem.Typography.caption)

                Text("\(currentIndex + 1)/\(totalCount)")
                    .font(DesignSystem.Typography.subheadline)

                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: DesignSystem.Spacing.xs)
                            .fill(.secondary.opacity(DesignSystem.Opacity.secondary))

                        RoundedRectangle(cornerRadius: DesignSystem.Spacing.xs)
                            .fill(.primary)
                            .frame(width: geometry.size.width * CGFloat(currentIndex + 1) / CGFloat(totalCount))
                    }
                }
                .frame(width: 200, height: DesignSystem.Spacing.small)
            }
            .padding(.horizontal, DesignSystem.Spacing.regular)
            .padding(.vertical, DesignSystem.Spacing.medium)

            Spacer()
        }
        .padding(.horizontal)
        .padding(.top, DesignSystem.Spacing.small)
        .padding(.bottom, DesignSystem.Spacing.medium)
    }
}
