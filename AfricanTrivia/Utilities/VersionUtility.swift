//
//  VersionUtility.swift
//  AfricanTrivia
//
//  Created by diayan siat on 22/11/2025.
//

import SwiftUI

/// Utility to check iOS version availability for features like Liquid Glass
struct VersionUtility {

    /// Check if Liquid Glass is available (iOS 26+)
    static var isLiquidGlassAvailable: Bool {
        if #available(iOS 26.0, *) {
            return true
        }
        return false
    }

    /// Apply glass effect modifier conditionally based on iOS version
    static func applyGlassEffectIfAvailable<Content: View>(
        to view: Content,
        glassStyle: GlassStyle = .regular
    ) -> some View {
        Group {
            if #available(iOS 26.0, *) {
                view.modifier(ConditionalGlassModifier(glassStyle: glassStyle))
            } else {
                view.modifier(FallbackGlassModifier())
            }
        }
    }
}

// MARK: - Glass Style Configuration

enum GlassStyle {
    case regular
    case tinted(Color)
    case interactive
    case interactiveTinted(Color)
}

// MARK: - Conditional Glass Modifier (iOS 26+)

@available(iOS 26.0, *)
struct ConditionalGlassModifier: ViewModifier {
    let glassStyle: GlassStyle

    func body(content: Content) -> some View {
        switch glassStyle {
        case .regular:
            content.glassEffect(in: .rect(cornerRadius: 12))
        case .tinted(let color):
            content.glassEffect(.regular.tint(color), in: .rect(cornerRadius: 12))
        case .interactive:
            content.glassEffect(.regular.interactive(), in: .rect(cornerRadius: 12))
        case .interactiveTinted(let color):
            content.glassEffect(.regular.tint(color).interactive(), in: .rect(cornerRadius: 12))
        }
    }
}

// MARK: - Fallback Glass Modifier (iOS 18-25)

struct FallbackGlassModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(.ultraThinMaterial)
            .clipShape(Capsule())
    }
}

// MARK: - View Extension for Easy Usage

extension View {
    /// Apply glass effect with automatic version handling
    /// - Parameter style: The glass style to apply (only used on iOS 26+)
    /// - Returns: View with glass effect on iOS 26+, or material fallback on iOS 18-25
    func glassEffectCompatible(style: GlassStyle = .regular) -> some View {
        VersionUtility.applyGlassEffectIfAvailable(to: self, glassStyle: style)
    }
}
