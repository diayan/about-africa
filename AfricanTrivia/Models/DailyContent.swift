//
//  DailyContent.swift
//  AfricanTrivia
//
//  Created by diayan siat on 20/11/2025.
//

import Foundation

struct DailyContent: Identifiable, Codable {
    let id: String
    let date: Date
    let facts: [Fact] // 5 facts (one per category)
    let quiz: Quiz

    enum CodingKeys: String, CodingKey {
        case id
        case date
        case facts
        case quiz
    }
}

// MARK: - Convenience

extension DailyContent {
    /// Check if this is today's content
    func isToday() -> Bool {
        Calendar.current.isDateInToday(date)
    }

    /// Get fact by category
    func fact(for category: FactCategory) -> Fact? {
        facts.first { $0.category == category }
    }

    /// Total points available today
    var totalPointsAvailable: Int {
        let factPoints = facts.reduce(0) { $0 + $1.points }
        return factPoints + quiz.totalPoints
    }
}
