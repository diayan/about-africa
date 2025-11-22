//
//  GeoJSONModels.swift
//  AfricanTrivia
//
//  Created by diayan siat on 20/11/2025.
//

import Foundation

// MARK: - GeoJSON Root Structure

struct GeoJSONFeatureCollection: Codable {
    let type: String
    let name: String?
    let features: [GeoJSONFeature]
}

// MARK: - GeoJSON Feature

struct GeoJSONFeature: Codable, Identifiable {
    var id: String { properties.iso3 }

    let type: String
    let properties: CountryProperties
    let geometry: Geometry
}

// MARK: - Country Properties

struct CountryProperties: Codable {
    let name: String
    let iso3: String
    let iso2: String

    enum CodingKeys: String, CodingKey {
        case name
        case iso3 = "ISO3166-1-Alpha-3"
        case iso2 = "ISO3166-1-Alpha-2"
    }
}

// MARK: - Geometry

struct Geometry: Codable {
    let type: String // "Polygon" or "MultiPolygon"
    let coordinates: GeometryCoordinates

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(String.self, forKey: .type)

        // Handle both Polygon and MultiPolygon
        if type == "Polygon" {
            let polygonCoords = try container.decode([[[Double]]].self, forKey: .coordinates)
            coordinates = .polygon(polygonCoords)
        } else if type == "MultiPolygon" {
            let multiPolygonCoords = try container.decode([[[[Double]]]].self, forKey: .coordinates)
            coordinates = .multiPolygon(multiPolygonCoords)
        } else {
            throw DecodingError.dataCorruptedError(
                forKey: .coordinates,
                in: container,
                debugDescription: "Unsupported geometry type: \(type)"
            )
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)

        switch coordinates {
        case .polygon(let coords):
            try container.encode(coords, forKey: .coordinates)
        case .multiPolygon(let coords):
            try container.encode(coords, forKey: .coordinates)
        }
    }

    enum CodingKeys: String, CodingKey {
        case type, coordinates
    }
}

// MARK: - Geometry Coordinates

enum GeometryCoordinates {
    case polygon([[[Double]]])        // Array of rings, each ring is array of [lon, lat] pairs
    case multiPolygon([[[[Double]]]]) // Array of polygons, each polygon is array of rings

    // Get all polygons as array of polygon definitions
    // Each polygon is an array of rings [[Double]]
    var allPolygons: [[[[Double]]]] {
        switch self {
        case .polygon(let poly):
            return [poly]  // Wrap single polygon in array
        case .multiPolygon(let multiPoly):
            return multiPoly  // Already array of polygons
        }
    }
}
