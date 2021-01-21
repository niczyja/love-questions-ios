//
//  Question.swift
//  Love Questions
//
//  Created by Maciej Sienkiewicz on 17/01/2021.
//

import Foundation

class Question {
    
    //MARK: Properties
    var number: Int
    var text: String
    
    //MARK: Initialization
    init(withNumber number: Int, text: String) {
        self.number = number
        self.text = text
    }

}

//MARK: Hashable

extension Question: Hashable {

    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

//MARK: Equatable

extension Question: Equatable {
    
    static func == (lhs: Question, rhs: Question) -> Bool {
        return lhs.text == rhs.text
    }
}
