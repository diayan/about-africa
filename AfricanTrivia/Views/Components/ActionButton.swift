//
//  ActionButton.swift
//  AfricanTrivia
//
//  Created by diayan siat on 25/11/2025.
//

import SwiftUI

struct ActionButton: View {
    let icon: String
    var color: Color? = nil
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundStyle(color ?? .primary)
                .frame(width: 36, height: 36)
        }
    }
}
