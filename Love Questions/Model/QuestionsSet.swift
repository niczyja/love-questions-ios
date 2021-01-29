//
//  QuestionsSet.swift
//  Love Questions
//
//  Created by Maciej Sienkiewicz on 17/01/2021.
//

import Foundation

struct QuestionsSet {
    
    let name: String
    let questions: Set<Question>
    
    private var sortedQuestions: [Question]?
    private var currentIndex: Int?
    
    init(withName name: String, questions: Set<Question>) {
        self.name = name
        self.questions = questions
    }
    
    mutating func nextQuestion() -> Question {
        if sortedQuestions == nil {
            sortedQuestions = questions.sorted()
        }
        
        if currentIndex == nil || currentIndex == sortedQuestions!.endIndex - 1 {
            currentIndex = sortedQuestions!.startIndex
        } else {
            currentIndex = sortedQuestions!.index(after: currentIndex!)
        }
        
        return sortedQuestions![currentIndex!]
    }
}

extension QuestionsSet: Codable {
    
}
