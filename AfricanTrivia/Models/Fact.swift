//
//  Fact.swift
//  AfricanTrivia
//
//  Created by diayan siat on 20/11/2025.
//

import Foundation

struct Fact: Identifiable, Codable {
    let id: String
    let category: FactCategory
    let title: String
    let shortDescription: String
    let fullContent: String
    let imageURL: String?
    let audioURL: String? // For language pronunciations
    let countryISO: String? // ISO3 code (e.g., "GHA", "NGA")
    let tags: [String]
    let sources: [String] // URLs or citations for fact-checking
    let points: Int // Points awarded for reading
    let date: Date // Which day this fact appears

    enum CodingKeys: String, CodingKey {
        case id
        case category
        case title
        case shortDescription = "short_description"
        case fullContent = "full_content"
        case imageURL = "image_url"
        case audioURL = "audio_url"
        case countryISO = "country_iso"
        case tags
        case sources
        case points
        case date
    }
}

enum FactCategory: String, Codable, CaseIterable {
    case historicalMoment = "historical_moment"
    case africanLanguage = "african_language"
    case geography = "geography"
    case notablePerson = "notable_person"
    case culturalTradition = "cultural_tradition"

    var displayName: String {
        switch self {
        case .historicalMoment: return "Historical Moment"
        case .africanLanguage: return "African Language"
        case .geography: return "Geography"
        case .notablePerson: return "Notable African"
        case .culturalTradition: return "Cultural Tradition"
        }
    }

    var icon: String {
        switch self {
        case .historicalMoment: return "clock.fill"
        case .africanLanguage: return "quote.bubble.fill"
        case .geography: return "globe.africa.fill"
        case .notablePerson: return "person.fill"
        case .culturalTradition: return "sparkles"
        }
    }
}
