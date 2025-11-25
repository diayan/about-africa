//
//  CountryTag.swift
//  AfricanTrivia
//
//  Created by diayan siat on 25/11/2025.
//

import SwiftUI

struct CountryTag: View {
    let countryISO: String

    var body: some View {
        HStack(spacing: DesignSystem.Spacing.small) {
            Image(systemName: "mappin.circle.fill")
                .font(DesignSystem.Typography.caption)
            Text(countryISO)
                .font(DesignSystem.Typography.caption.bold())
        }
        .foregroundStyle(DesignSystem.Colors.accentOrange)
        .padding(.horizontal, DesignSystem.Spacing.regular)
        .padding(.vertical, DesignSystem.Spacing.small)
        .background(DesignSystem.Colors.accentOrange.opacity(DesignSystem.Opacity.subtle), in: Capsule())
    }
}
