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
}

extension QuestionsSet: Codable {
    
}
