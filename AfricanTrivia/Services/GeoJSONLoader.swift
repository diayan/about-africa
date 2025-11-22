//
//  GeoJSONLoader.swift
//  AfricanTrivia
//
//  Created by diayan siat on 20/11/2025.
//

import Foundation

@Observable
class GeoJSONLoader {
    var countries: [GeoJSONFeature] = []
    var isLoading = false
    var error: Error?

    func loadAfricanCountries() {
        isLoading = true
        error = nil

        // Load GeoJSON file from bundle
        guard let url = Bundle.main.url(forResource: "africa_countries", withExtension: "geojson") else {
            error = GeoJSONError.fileNotFound
            isLoading = false
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let featureCollection = try decoder.decode(GeoJSONFeatureCollection.self, from: data)

            countries = featureCollection.features
            isLoading = false

            print("✅ Loaded \(countries.count) African countries")
        } catch {
            self.error = error
            isLoading = false
            print("❌ Error loading GeoJSON: \(error)")
        }
    }
}

// MARK: - Errors

enum GeoJSONError: LocalizedError {
    case fileNotFound
    case parsingFailed

    var errorDescription: String? {
        switch self {
        case .fileNotFound:
            return "Could not find africa_countries.geojson in bundle"
        case .parsingFailed:
            return "Failed to parse GeoJSON data"
        }
    }
}
