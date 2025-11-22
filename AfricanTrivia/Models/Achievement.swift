//
//  Achievement.swift
//  AfricanTrivia
//
//  Created by diayan siat on 20/11/2025.
//

import Foundation

struct Achievement: Identifiable, Codable {
    let id: String
    let name: String
    let description: String
    let iconName: String // SF Symbol name
    let requirement: AchievementRequirement
    let points: Int

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case iconName = "icon_name"
        case requirement
        case points
    }
}

enum AchievementRequirement: Codable, Equatable {
    case streak(days: Int)
    case countries(count: Int)
    case quizzes(count: Int)
    case points(total: Int)
    case factsRead(count: Int)

    enum CodingKeys: String, CodingKey {
        case type
        case value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        let value = try container.decode(Int.self, forKey: .value)

        switch type {
        case "streak":
            self = .streak(days: value)
        case "countries":
            self = .countries(count: value)
        case "quizzes":
            self = .quizzes(count: value)
        case "points":
            self = .points(total: value)
        case "facts_read":
            self = .factsRead(count: value)
        default:
            throw DecodingError.dataCorruptedError(
                forKey: .type,
                in: container,
                debugDescription: "Unknown achievement type: \(type)"
            )
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case .streak(let days):
            try container.encode("streak", forKey: .type)
            try container.encode(days, forKey: .value)
        case .countries(let count):
            try container.encode("countries", forKey: .type)
            try container.encode(count, forKey: .value)
        case .quizzes(let count):
            try container.encode("quizzes", forKey: .type)
            try container.encode(count, forKey: .value)
        case .points(let total):
            try container.encode("points", forKey: .type)
            try container.encode(total, forKey: .value)
        case .factsRead(let count):
            try container.encode("facts_read", forKey: .type)
            try container.encode(count, forKey: .value)
        }
    }
}

// MARK: - Sample Achievements

extension Achievement {
    static let samples: [Achievement] = [
        Achievement(
            id: "first_streak",
            name: "Getting Started",
            description: "Complete your first day",
            iconName: "star.fill",
            requirement: .streak(days: 1),
            points: 10
        ),
        Achievement(
            id: "week_streak",
            name: "Week Warrior",
            description: "Maintain a 7-day streak",
            iconName: "flame.fill",
            requirement: .streak(days: 7),
            points: 50
        ),
        Achievement(
            id: "explorer",
            name: "Continental Explorer",
            description: "Learn about 10 countries",
            iconName: "globe.africa.fill",
            requirement: .countries(count: 10),
            points: 100
        ),
        Achievement(
            id: "quiz_master",
            name: "Quiz Master",
            description: "Complete 10 quizzes",
            iconName: "checkmark.circle.fill",
            requirement: .quizzes(count: 10),
            points: 75
        )
    ]
}
