//
//  Question.swift
//  Love Questions
//
//  Created by Maciej Sienkiewicz on 17/01/2021.
//

import Foundation

struct Question {
    
    let number: Int
    let text: String
}

extension Question: Codable {
    
}

extension Question: Hashable {

    public func hash(into hasher: inout Hasher) {
        hasher.combine(text)
    }
}

extension Question: Equatable {
    
    static func == (lhs: Question, rhs: Question) -> Bool {
        return lhs.text == rhs.text
    }
}

extension Question: Comparable {
    
    static func < (lhs: Question, rhs: Question) -> Bool {
        return lhs.number < rhs.number
    }
}
