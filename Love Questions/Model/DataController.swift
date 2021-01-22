//
//  DataController.swift
//  Love Questions
//
//  Created by Maciej Sienkiewicz on 21/01/2021.
//

import Foundation

class DataController {
    
    var questionsSets: [QuestionsSet]?
    
    init?() {
        if let localData = readLocalFile(withName: "data"), let decodedData = parse(jsonData: localData) {
            self.questionsSets = decodedData
        } else {
            return nil
        }
    }
    
    private func readLocalFile(withName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"), let jsonData = try String.init(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }

    private func parse(jsonData: Data) -> [QuestionsSet]? {
        do {
            return try JSONDecoder().decode([QuestionsSet].self, from: jsonData)
        } catch {
            print(error)
        }
        
        return nil
    }
}
