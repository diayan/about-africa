//
//  MapTabView.swift
//  AfricanTrivia
//
//  Created by diayan siat on 22/11/2025.
//

import SwiftUI

struct MapTabView: View {
    var body: some View {
        NavigationStack {
            AfricaMapView()
                .navigationTitle("Explore Africa")
                .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    MapTabView()
}
