//
//  CoordinateProjection.swift
//  AfricanTrivia
//
//  Created by diayan siat on 20/11/2025.
//

import Foundation
import CoreGraphics

struct CoordinateProjection {
    // Africa bounding box (approximate)
    // Longitude: -25° (West) to 52° (East)
    // Latitude: -35° (South) to 37° (North)
    private let minLon: Double = -25.0
    private let maxLon: Double = 52.0
    private let minLat: Double = -35.0
    private let maxLat: Double = 37.0

    /// Projects latitude/longitude to normalized coordinates (0-1 range)
    /// - Parameters:
    ///   - longitude: Longitude in degrees
    ///   - latitude: Latitude in degrees
    /// - Returns: CGPoint with x,y in 0-1 range
    func project(longitude: Double, latitude: Double) -> CGPoint {
        // Normalize longitude to 0-1 range
        let x = (longitude - minLon) / (maxLon - minLon)

        // Use Mercator projection for latitude
        let latRad = latitude * .pi / 180.0
        let mercatorY = log(tan(.pi / 4.0 + latRad / 2.0))

        // Calculate mercator bounds for min/max latitude
        let minLatRad = minLat * .pi / 180.0
        let maxLatRad = maxLat * .pi / 180.0
        let minMercatorY = log(tan(.pi / 4.0 + minLatRad / 2.0))
        let maxMercatorY = log(tan(.pi / 4.0 + maxLatRad / 2.0))

        // Normalize y to 0-1 range (inverted because screen coordinates go top-to-bottom)
        let y = 1.0 - (mercatorY - minMercatorY) / (maxMercatorY - minMercatorY)

        return CGPoint(x: x, y: y)
    }

    /// Converts a normalized point (0-1) to actual screen coordinates
    /// Maintains aspect ratio by fitting the map within the available size
    /// - Parameters:
    ///   - normalizedPoint: Point in 0-1 range
    ///   - size: Target size for rendering
    /// - Returns: CGPoint in screen coordinates
    func toScreenCoordinates(_ normalizedPoint: CGPoint, size: CGSize) -> CGPoint {
        // Calculate Africa's geographic aspect ratio
        let geoWidth = maxLon - minLon
        let geoHeight = maxLat - minLat
        let geoAspectRatio = geoWidth / geoHeight

        // Calculate screen aspect ratio
        let screenAspectRatio = size.width / size.height

        // Determine scaling to fit map while maintaining aspect ratio
        var scale: CGFloat
        var offsetX: CGFloat = 0
        var offsetY: CGFloat = 0

        if geoAspectRatio > screenAspectRatio {
            // Map is wider than screen - fit to width
            scale = size.width
            offsetY = (size.height - (size.width / geoAspectRatio)) / 2
        } else {
            // Map is taller than screen - fit to height
            scale = size.height * geoAspectRatio
            offsetX = (size.width - scale) / 2
        }

        return CGPoint(
            x: normalizedPoint.x * scale + offsetX,
            y: normalizedPoint.y * (scale / geoAspectRatio) + offsetY
        )
    }

    /// Projects a polygon (list of [lon, lat] coordinates) to screen space
    /// - Parameters:
    ///   - coordinates: Array of [longitude, latitude] pairs
    ///   - size: Target size for rendering
    /// - Returns: Array of CGPoints in screen coordinates
    func projectPolygon(_ coordinates: [[Double]], size: CGSize) -> [CGPoint] {
        return coordinates.compactMap { coord in
            guard coord.count >= 2 else { return nil }
            let lon = coord[0]
            let lat = coord[1]
            let normalized = project(longitude: lon, latitude: lat)
            return toScreenCoordinates(normalized, size: size)
        }
    }
}
