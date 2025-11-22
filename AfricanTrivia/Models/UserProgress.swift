//
//  UserProgress.swift
//  AfricanTrivia
//
//  Created by diayan siat on 20/11/2025.
//

import Foundation

struct UserProgress: Codable {
    let userID: String

    // Streak
    var currentStreak: Int
    var longestStreak: Int
    var lastActiveDate: Date

    // Points & Level
    var totalPoints: Int
    var level: Int

    // Exploration
    var countriesExplored: Set<String> // ISO3 codes
    var achievementsUnlocked: Set<String> // Achievement IDs

    // Activity tracking
    var factsRead: [String] // Fact IDs
    var quizResults: [QuizResult]

    // Timestamps
    let createdAt: Date
    var updatedAt: Date

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case currentStreak = "current_streak"
        case longestStreak = "longest_streak"
        case lastActiveDate = "last_active_date"
        case totalPoints = "total_points"
        case level
        case countriesExplored = "countries_explored"
        case achievementsUnlocked = "achievements_unlocked"
        case factsRead = "facts_read"
        case quizResults = "quiz_results"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Helper Methods

extension UserProgress {
    static func new(userID: String) -> UserProgress {
        let now = Date()
        return UserProgress(
            userID: userID,
            currentStreak: 0,
            longestStreak: 0,
            lastActiveDate: now,
            totalPoints: 0,
            level: 0,
            countriesExplored: [],
            achievementsUnlocked: [],
            factsRead: [],
            quizResults: [],
            createdAt: now,
            updatedAt: now
        )
    }
}
