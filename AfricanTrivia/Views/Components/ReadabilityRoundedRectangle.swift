//
//  ReadabilityRoundedRectangle.swift
//  AfricanTrivia
//
//  Created by diayan siat on 23/11/2025.
//

import SwiftUI

/// A view that adds a gradient over an image to improve legibility for a text overlay.
struct ReadabilityRoundedRectangle: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 15.0)
            .foregroundStyle(.clear)
            .background(
                LinearGradient(colors: [.black.opacity(0.8), .clear], startPoint: .bottom, endPoint: .center)
            )
            .containerRelativeFrame(.vertical)
            .clipped()
    }
}
