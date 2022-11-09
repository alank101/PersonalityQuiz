//
//  Questions.swift
//  PersonalityQuiz
//
//  Created by Alan Barry on 11/7/22.
//

import Foundation

enum ResponseType {
    case single, multiple, ranged
}

struct AnimalQuestion {
    var text: String
    var type: ResponseType
    var answers: [AnimalAnswer]
}

struct InstrumentQuestion {
    var text: String
    var type: ResponseType
    var answers: [InstrumentAnswer]
}

struct AnimalAnswer {
    var text: String
    var type: AnimalType
}

struct InstrumentAnswer {
    var text: String
    var type: InstrumentType
}

enum AnimalType: Character {
    case dog = "🐶", cat =  "🐱", rabbit = "🐰", turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "You are incredibly outgoing. You surround yourself with the people you love and enjoy activities with your friends."
        case .cat:
            return "Mischevious, yet mild-tempered, you enjoy doing things on your own terms."
        case .rabbit:
            return "You love everything that's soft. You are healthy and full of energy."
        case .turtle:
            return "You are wise beyond your years, and you focus on the details. Slow and steady wins the race."
        }
    }
}

enum InstrumentType: Character {
    case trumpet = "🎺", piano = "🎹", violin = "🎻", saxophone = "🎷"
    
    var definition: String {
        switch self {
        case.piano:
            return "You are creative, purposeful, and an effective communicator."
        case .trumpet:
            return "You are secured and boisterous in your view of yourself and those around you."
        case .violin:
            return "You exude curiosity and have many wonders in life."
        case .saxophone:
            return "You are a lively and extroverted person who is usually well balanced in your self-perception."
        }
    }
}
