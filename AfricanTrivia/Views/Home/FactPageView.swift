//
//  FactPageView.swift
//  AfricanTrivia
//
//  Created by diayan siat on 25/11/2025.
//

import SwiftUI

struct FactPageView: View {
    @Environment(\.colorScheme) private var colorScheme
    let fact: Fact
    let isSaved: Bool
    let isLoved: Bool
    let onSave: () -> Void
    let onLove: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                if fact.imageURL != nil {
                    factWithImageLayout
                } else {
                    factCardLayout
                        .padding(.horizontal, 24)
                        .padding(.top, 40)
                }
            }

            actionButtons
                .padding(.horizontal)
                .padding(.vertical, 16)
        }
    }

    private var factWithImageLayout: some View {
        VStack(spacing: DesignSystem.Spacing.large) {
            CategoryBadge(category: fact.category)

            RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.regular)
                .fill(.secondary.opacity(DesignSystem.Opacity.subtle))
                .frame(minHeight: 200, maxHeight: 400)
                .overlay {
                    Image(systemName: "photo")
                        .font(.system(size: 40))
                        .foregroundStyle(.secondary)
                }

            Text(fact.title)
                .font(DesignSystem.Typography.factTitle)
                .multilineTextAlignment(.center)

            if fact.category == .africanLanguage {
                PronunciationButton(text: fact.shortDescription) {
                    // TODO: Play audio
                }
            }

            Text(fact.shortDescription)
                .font(DesignSystem.Typography.body)
                .lineSpacing(6)
                .multilineTextAlignment(.leading)

            if let countryISO = fact.countryISO {
                CountryTag(countryISO: countryISO)
            }
        }
        .cardStyle(colorScheme: colorScheme)
        .padding(.horizontal, DesignSystem.Spacing.large)
        .padding(.vertical, DesignSystem.Spacing.xxl)
    }

    private var factCardLayout: some View {
        VStack(spacing: DesignSystem.Spacing.large) {
            CategoryBadge(category: fact.category)

            Text(fact.title)
                .font(DesignSystem.Typography.factTitle)
                .multilineTextAlignment(.center)

            if fact.category == .africanLanguage {
                PronunciationButton(text: fact.shortDescription) {
                    // TODO: Play audio
                }
            }

            Text(fact.shortDescription)
                .font(DesignSystem.Typography.body)
                .lineSpacing(6)
                .multilineTextAlignment(.leading)

            if let countryISO = fact.countryISO {
                CountryTag(countryISO: countryISO)
            }
        }
        .cardStyle(colorScheme: colorScheme)
    }

    private var actionButtons: some View {
        HStack(spacing: DesignSystem.Spacing.regular) {
            ActionButton(icon: "info.circle") {
                // TODO: Show more info
            }

            ActionButton(icon: "square.and.arrow.up") {
                // TODO: Share fact
            }

            ActionButton(
                icon: isLoved ? "heart.fill" : "heart",
                color: isLoved ? DesignSystem.Colors.accentRed : nil
            ) {
                withAnimation { onLove() }
            }

            ActionButton(
                icon: isSaved ? "bookmark.fill" : "bookmark",
                color: isSaved ? DesignSystem.Colors.accentOrange : nil
            ) {
                withAnimation { onSave() }
            }
        }
        .padding(.horizontal, DesignSystem.Spacing.large)
        .padding(.vertical, DesignSystem.Spacing.regular)
    }
}
