//
//  CategoryBadge.swift
//  AfricanTrivia
//
//  Created by diayan siat on 25/11/2025.
//

import SwiftUI

struct CategoryBadge: View {
    let category: FactCategory

    var body: some View {
        Text(category.displayName.uppercased())
            .font(DesignSystem.Typography.categoryBadge)
            .foregroundStyle(.secondary)
            .tracking(1.5)
    }
}
