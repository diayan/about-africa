//
//  DesignSystem.swift
//  AfricanTrivia
//
//  Created by diayan siat on 25/11/2025.
//

import SwiftUI

enum DesignSystem {

    // MARK: - Colors

    enum Colors {
        static let lightBackground = Color(red: 0.93, green: 0.91, blue: 0.87)
        static let darkBackground = Color(red: 0.15, green: 0.15, blue: 0.15)

        static let accentOrange = Color.orange
        static let accentRed = Color.red

        static func adaptiveBackground(for colorScheme: ColorScheme) -> Color {
            colorScheme == .dark ? darkBackground : lightBackground
        }
    }

    // MARK: - Typography

    enum Typography {
        static let factTitle = Font.system(size: 36, weight: .bold, design: .serif)
        static let sectionTitle = Font.title3.bold()
        static let categoryBadge = Font.caption2.bold()
        static let body = Font.body
        static let caption = Font.caption
        static let subheadline = Font.subheadline.bold()
    }

    // MARK: - Spacing

    enum Spacing {
        static let xs: CGFloat = 4
        static let small: CGFloat = 8
        static let medium: CGFloat = 12
        static let regular: CGFloat = 16
        static let large: CGFloat = 24
        static let xl: CGFloat = 32
        static let xxl: CGFloat = 40
    }

    // MARK: - Corner Radius

    enum CornerRadius {
        static let small: CGFloat = 8
        static let regular: CGFloat = 16
        static let large: CGFloat = 24
    }

    // MARK: - Shadows

    enum Shadows {
        static let card = (color: Color.black.opacity(0.08), radius: CGFloat(12), x: CGFloat(0), y: CGFloat(4))
        static let elevated = (color: Color.black.opacity(0.1), radius: CGFloat(10), x: CGFloat(0), y: CGFloat(5))
    }

    // MARK: - Opacity

    enum Opacity {
        static let subtle: Double = 0.1
        static let secondary: Double = 0.2
    }
}

// MARK: - Convenience Extensions

extension View {
    func cardStyle(colorScheme: ColorScheme) -> some View {
        self
            .padding(DesignSystem.Spacing.xl)
            .background(
                DesignSystem.Colors.adaptiveBackground(for: colorScheme),
                in: RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.large)
            )
            .overlay(
                RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.large)
                    .stroke(Color.primary.opacity(DesignSystem.Opacity.subtle), lineWidth: 1)
            )
            .shadow(
                color: DesignSystem.Shadows.card.color,
                radius: DesignSystem.Shadows.card.radius,
                x: DesignSystem.Shadows.card.x,
                y: DesignSystem.Shadows.card.y
            )
    }
}
