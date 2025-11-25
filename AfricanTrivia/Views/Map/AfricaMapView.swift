//
//  AfricaMapView.swift
//  AfricanTrivia
//
//  Created by diayan siat on 20/11/2025.
//

import SwiftUI

struct AfricaMapView: View {
    @State private var geoJSONLoader = GeoJSONLoader()
    @State private var exploredCountries: Set<String> = []
    @State private var selectedCountry: GeoJSONFeature?

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background
                Color.blue.opacity(0.1)
                    .ignoresSafeArea()

                if geoJSONLoader.isLoading {
                    ProgressView("Loading map...")
                } else if let error = geoJSONLoader.error {
                    VStack {
                        Image(systemName: "exclamationmark.triangle")
                            .font(.system(size: 50))
                            .foregroundColor(.red)
                        Text("Error loading map")
                            .font(.headline)
                        Text(error.localizedDescription)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                } else {
                    // Render all countries
                    ForEach(geoJSONLoader.countries) { country in
                        CountryShape(
                            country: country,
                            size: geometry.size
                        )
                        .fill(fillColor(for: country), style: FillStyle(eoFill: true))
                        .stroke(Color.white, lineWidth: 0.5)
                        .contentShape(CountryShape(country: country, size: geometry.size), eoFill: true)
                        .onTapGesture {
                            handleCountryTap(country)
                        }
                    }

                    // Country info overlay
                    if let selected = selectedCountry {
                        VStack {
                            Spacer()
                            CountryInfoCard(country: selected, isExplored: exploredCountries.contains(selected.id))
                                .padding()
                        }
                    }
                }
            }
        }
        .onAppear {
            geoJSONLoader.loadAfricanCountries()
            // Demo: mark a few countries as explored
            exploredCountries = ["GHA", "NGA", "KEN", "ZAF", "EGY"]
        }
    }

    private func fillColor(for country: GeoJSONFeature) -> Color {
        if exploredCountries.contains(country.id) {
            return Color.green.opacity(0.6)
        } else {
            return Color.gray.opacity(0.3)
        }
    }

    private func handleCountryTap(_ country: GeoJSONFeature) {
        selectedCountry = country
        print("Tapped: \(country.properties.name)")
        print("Tapped: \(country.geometry.coordinates)")

    }
}

// MARK: - Country Shape

struct CountryShape: Shape {
    let country: GeoJSONFeature
    let size: CGSize

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let projection = CoordinateProjection()

        // Get all polygons (handles both Polygon and MultiPolygon)
        let allPolygons = country.geometry.coordinates.allPolygons

        for polygonRings in allPolygons {
            // Draw ALL rings: first ring is outer boundary, subsequent are holes
            for ring in polygonRings {
                let points = projection.projectPolygon(ring, size: size)

                if let firstPoint = points.first {
                    path.move(to: firstPoint)
                    for point in points.dropFirst() {
                        path.addLine(to: point)
                    }
                    path.closeSubpath()
                }
            }
        }

        return path
    }
}

// MARK: - Country Info Card

struct CountryInfoCard: View {
    let country: GeoJSONFeature
    let isExplored: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(country.properties.name)
                    .font(.title2)
                    .bold()
                Spacer()
                if isExplored {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                        .font(.title3)
                }
            }

            Text("Code: \(country.properties.iso3)")
                .font(.caption)
                .foregroundColor(.secondary)

            if isExplored {
                Text("Explored")
                    .font(.caption)
                    .foregroundColor(.green)
                    .bold()
            } else {
                Text("Not yet explored")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color(uiColor: .systemBackground))
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}

#Preview {
    AfricaMapView()
}
