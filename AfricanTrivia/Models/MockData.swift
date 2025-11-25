//
//  MockData.swift
//  AfricanTrivia
//
//  Created by diayan siat on 20/11/2025.
//

import Foundation

struct MockData {

    // MARK: - Mock Facts

    static let historicalFact = Fact(
        id: "fact_hist_001",
        category: .historicalMoment,
        title: "Battle of Adwa",
        shortDescription: "On March 1, 1896, Ethiopian forces led by Emperor Menelik II defeated the Italian army at the Battle of Adwa. This victory preserved Ethiopia's independence and made it the only African nation to successfully resist European colonization during the Scramble for Africa.",
        fullContent: """
        On March 1, 1896, Ethiopian forces led by Emperor Menelik II defeated the Italian army at the Battle of Adwa. This victory preserved Ethiopia's independence and made it the only African nation to successfully resist European colonization during the Scramble for Africa.

        The battle demonstrated the effectiveness of Ethiopian military strategy and modern weaponry. Emperor Menelik mobilized over 100,000 troops and employed superior knowledge of the terrain to outmaneuver the Italians.

        This victory had lasting symbolic importance across Africa and the African diaspora, representing resistance to colonialism and inspiring independence movements throughout the continent.
        """,
        imageURL: "https://example.com/battle-of-adwa.jpg",
        audioURL: nil,
        countryISO: "ETH",
        tags: ["independence", "military", "colonialism", "Ethiopia"],
        sources: ["https://en.wikipedia.org/wiki/Battle_of_Adwa"],
        points: 10,
        date: Date()
    )

    static let languageFact = Fact(
        id: "fact_lang_001",
        category: .africanLanguage,
        title: "Swahili Word: Jambo",
        shortDescription: """
        'Jambo' is one of the most recognized Swahili words, commonly used as a greeting meaning "Hello" or "Hi."
        """,
        fullContent: """
        'Jambo' is one of the most recognized Swahili words, commonly used as a greeting meaning "Hello" or "Hi."

        While 'Jambo' is popular with tourists, native Swahili speakers more commonly use 'Habari' (How are you?) or 'Mambo' (What's up?) in casual conversation.

        Swahili is spoken by over 200 million people across East Africa, including Kenya, Tanzania, Uganda, and parts of the Democratic Republic of Congo. It's one of the official languages of the African Union.
        """,
        imageURL: nil,
        audioURL: "https://example.com/jambo.mp3",
        countryISO: "KEN",
        tags: ["language", "swahili", "greetings"],
        sources: ["https://en.wikipedia.org/wiki/Swahili_language"],
        points: 10,
        date: Date()
    )

    static let geographyFact = Fact(
        id: "fact_geo_001",
        category: .geography,
        title: "Lake Victoria",
        shortDescription: "Lake Victoria is the largest lake in Africa and the world's second-largest freshwater lake by surface area, covering approximately 68,800 square kilometers.",
        
        fullContent: """
        Lake Victoria is the largest lake in Africa and the world's second-largest freshwater lake by surface area, covering approximately 68,800 square kilometers.

        The lake is shared by three countries: Tanzania (49%), Uganda (45%), and Kenya (6%). It serves as the primary source of the White Nile and supports the livelihoods of over 30 million people living in its basin.

        Named by explorer John Hanning Speke in 1858 after Queen Victoria, the lake is known locally by various names including Nyanza and Nam Lolwe.
        """,
        imageURL: "https://example.com/lake-victoria.jpg",
        audioURL: nil,
        countryISO: "TZA",
        tags: ["geography", "lakes", "East Africa"],
        sources: ["https://en.wikipedia.org/wiki/Lake_Victoria"],
        points: 10,
        date: Date()
    )

    static let notablePersonFact = Fact(
        id: "fact_person_001",
        category: .notablePerson,
        title: "Wangari Maathai",
        shortDescription: "First African woman to win the Nobel Peace Prize. Wangari Maathai (1940-2011) was a Kenyan environmental and political activist who founded the Green Belt Movement in 1977",
        fullContent: """
        Wangari Maathai (1940-2011) was a Kenyan environmental and political activist who founded the Green Belt Movement in 1977.

        Through her movement, over 51 million trees were planted across Kenya, combating deforestation and empowering rural women through environmental conservation.

        In 2004, she became the first African woman to receive the Nobel Peace Prize for her contribution to sustainable development, democracy, and peace. She also became the first woman in East and Central Africa to earn a doctoral degree.
        """,
        imageURL: "https://example.com/wangari-maathai.jpg",
        audioURL: nil,
        countryISO: "KEN",
        tags: ["activism", "environment", "Nobel Prize", "Kenya"],
        sources: ["https://en.wikipedia.org/wiki/Wangari_Maathai"],
        points: 10,
        date: Date()
    )

    static let culturalFact = Fact(
        id: "fact_culture_001",
        category: .culturalTradition,
        title: "Ethiopian Coffee Ceremony",
        shortDescription: "An important social and cultural tradition",
        fullContent: """
        The Ethiopian coffee ceremony is an integral part of Ethiopian culture and social life. Coffee originated in Ethiopia, and the ceremony is a sign of respect and friendship.

        The ceremony involves roasting green coffee beans over an open flame, grinding them by hand, and brewing the coffee in a special pot called a 'jebena.' The process takes about an hour and is usually performed by the woman of the household.

        Coffee is served in three rounds: 'Abol' (first), 'Tona' (second), and 'Baraka' (third, meaning 'blessing'). It's considered rude to leave before the third serving.
        """,
        imageURL: "https://example.com/coffee-ceremony.jpg",
        audioURL: nil,
        countryISO: "ETH",
        tags: ["culture", "coffee", "traditions", "Ethiopia"],
        sources: ["https://en.wikipedia.org/wiki/Ethiopian_coffee_ceremony"],
        points: 10,
        date: Date()
    )

    static let allMockFacts = [
        historicalFact,
        languageFact,
        geographyFact,
        notablePersonFact,
        culturalFact
    ]

    // MARK: - Mock Quiz

    static let mockQuiz = Quiz(
        id: "quiz_001",
        date: Date(),
        questions: [
            QuizQuestion(
                id: "q1",
                question: "In which year did Ethiopia defeat Italy at the Battle of Adwa?",
                options: ["1896", "1886", "1906", "1916"],
                correctAnswerIndex: 0,
                explanation: "The Battle of Adwa took place on March 1, 1896, resulting in a decisive Ethiopian victory.",
                relatedFactID: "fact_hist_001",
                points: 10,
                timeLimit: 30
            ),
            QuizQuestion(
                id: "q2",
                question: "What does the Swahili word 'Jambo' mean?",
                options: ["Goodbye", "Hello", "Thank you", "Please"],
                correctAnswerIndex: 1,
                explanation: "'Jambo' is a common Swahili greeting meaning 'Hello' or 'Hi.'",
                relatedFactID: "fact_lang_001",
                points: 10,
                timeLimit: 30
            ),
            QuizQuestion(
                id: "q3",
                question: "Which three countries share Lake Victoria?",
                options: [
                    "Kenya, Tanzania, Rwanda",
                    "Uganda, Tanzania, Kenya",
                    "Ethiopia, Kenya, Uganda",
                    "Tanzania, Malawi, Kenya"
                ],
                correctAnswerIndex: 1,
                explanation: "Lake Victoria is shared by Uganda (45%), Tanzania (49%), and Kenya (6%).",
                relatedFactID: "fact_geo_001",
                points: 10,
                timeLimit: 30
            ),
            QuizQuestion(
                id: "q4",
                question: "What movement did Wangari Maathai found?",
                options: [
                    "The Peace Movement",
                    "The Green Belt Movement",
                    "The Women's Rights Movement",
                    "The Democracy Movement"
                ],
                correctAnswerIndex: 1,
                explanation: "Wangari Maathai founded the Green Belt Movement in 1977, which planted over 51 million trees in Kenya.",
                relatedFactID: "fact_person_001",
                points: 10,
                timeLimit: 30
            ),
            QuizQuestion(
                id: "q5",
                question: "Where did coffee originate?",
                options: ["Brazil", "Colombia", "Ethiopia", "Yemen"],
                correctAnswerIndex: 2,
                explanation: "Coffee originated in Ethiopia, where the coffee ceremony remains an important cultural tradition.",
                relatedFactID: "fact_culture_001",
                points: 10,
                timeLimit: 30
            )
        ],
        totalPoints: 50
    )

    // MARK: - Mock Daily Content

    static let mockDailyContent = DailyContent(
        id: "daily_001",
        date: Date(),
        facts: allMockFacts,
        quiz: mockQuiz
    )

    // MARK: - Mock User Progress

    static let mockUserProgress = UserProgress(
        userID: "user_001",
        currentStreak: 7,
        longestStreak: 12,
        lastActiveDate: Date(),
        totalPoints: 340,
        level: 3,
        countriesExplored: ["GHA", "NGA", "KEN", "ZAF", "EGY"],
        achievementsUnlocked: ["first_streak", "week_streak"],
        factsRead: ["fact_hist_001", "fact_lang_001"],
        quizResults: [],
        createdAt: Date().addingTimeInterval(-30 * 24 * 60 * 60), // 30 days ago
        updatedAt: Date()
    )

    // MARK: - Mock Quiz Result

    static let mockQuizResult = QuizResult(
        id: "result_001",
        quizID: "quiz_001",
        date: Date(),
        answers: [
            QuizAnswer(questionID: "q1", selectedAnswerIndex: 0, isCorrect: true, timeSpent: 15),
            QuizAnswer(questionID: "q2", selectedAnswerIndex: 1, isCorrect: true, timeSpent: 10),
            QuizAnswer(questionID: "q3", selectedAnswerIndex: 1, isCorrect: true, timeSpent: 20),
            QuizAnswer(questionID: "q4", selectedAnswerIndex: 0, isCorrect: false, timeSpent: 25),
            QuizAnswer(questionID: "q5", selectedAnswerIndex: 2, isCorrect: true, timeSpent: 12)
        ],
        score: 4,
        totalQuestions: 5,
        pointsEarned: 40,
        completionTime: 82
    )
}
