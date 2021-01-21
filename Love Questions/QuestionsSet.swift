//
//  QuestionsSet.swift
//  Love Questions
//
//  Created by Maciej Sienkiewicz on 17/01/2021.
//

import Foundation

class QuestionsSet {
    
    //MARK: Properties
    let questions: Set<Question>
    var currentQuestion: Question
    
    init?() {
        if let localData = readLocalFile(withName: "data"), let decodedData = parse(jsonData: localData) {
            var questions = Set<Question>()
            for question in decodedData {
                questions.insert(Question(withNumber: question.number, text: question.text))
            }
            self.questions = questions
            self.currentQuestion = questions.first!
        } else {
            return nil
        }
    }
    
    public func nextQuestion() -> Question {
        let index = self.questions.firstIndex(of: self.currentQuestion)!
        let nextIndex = self.questions.index(after: index)
        
        if nextIndex == self.questions.endIndex {
            self.currentQuestion = self.questions.first!
        } else {
            self.currentQuestion = self.questions[nextIndex]
        }

        return self.currentQuestion
    }
}
