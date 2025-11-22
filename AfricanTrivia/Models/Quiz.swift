//
//  Quiz.swift
//  AfricanTrivia
//
//  Created by diayan siat on 20/11/2025.
//

import Foundation

struct Quiz: Identifiable, Codable {
    let id: String
    let date: Date
    let questions: [QuizQuestion]
    let totalPoints: Int

    enum CodingKeys: String, CodingKey {
        case id
        case date
        case questions
        case totalPoints = "total_points"
    }
}

struct QuizQuestion: Identifiable, Codable {
    let id: String
    let question: String
    let options: [String] // Array of 4 answer choices
    let correctAnswerIndex: Int // Index of correct answer (0-3)
    let explanation: String // Why this is the correct answer
    let relatedFactID: String? // Links back to today's facts
    let points: Int
    let timeLimit: Int? // Seconds (optional)

    enum CodingKeys: String, CodingKey {
        case id
        case question
        case options
        case correctAnswerIndex = "correct_answer_index"
        case explanation
        case relatedFactID = "related_fact_id"
        case points
        case timeLimit = "time_limit"
    }
}

// User's answer to a quiz question
struct QuizAnswer: Codable {
    let questionID: String
    let selectedAnswerIndex: Int
    let isCorrect: Bool
    let timeSpent: TimeInterval // How long they took to answer

    enum CodingKeys: String, CodingKey {
        case questionID = "question_id"
        case selectedAnswerIndex = "selected_answer_index"
        case isCorrect = "is_correct"
        case timeSpent = "time_spent"
    }
}

// Complete quiz result after finishing
struct QuizResult: Identifiable, Codable {
    let id: String
    let quizID: String
    let date: Date
    let answers: [QuizAnswer]
    let score: Int // Number correct
    let totalQuestions: Int
    let pointsEarned: Int
    let completionTime: TimeInterval

    enum CodingKeys: String, CodingKey {
        case id
        case quizID = "quiz_id"
        case date
        case answers
        case score
        case totalQuestions = "total_questions"
        case pointsEarned = "points_earned"
        case completionTime = "completion_time"
    }

    // Computed property for percentage
    var percentage: Double {
        guard totalQuestions > 0 else { return 0 }
        return Double(score) / Double(totalQuestions) * 100
    }
}
