//
//  DataController.swift
//  Love Questions
//
//  Created by Maciej Sienkiewicz on 21/01/2021.
//

import Foundation

class DataController {
    
    static let file = "data"
    var questionsSets = [QuestionsSet]()
    
    init() {
        if let localData = readLocalFile(withName: DataController.file), let decodedData = parse(jsonData: localData) {
            self.questionsSets = decodedData
        }
    }
    
    public func persistData() {
        do {
            let jsonData = try JSONEncoder().encode(self.questionsSets)
            writeLocalFile(withName: DataController.file, data: jsonData)
        } catch {
            print(error)
        }
    }
    
    private func writeLocalFile(withName name: String, data: Data) {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json") {
                let url = URL.init(fileURLWithPath: bundlePath)
                try data.write(to: url, options: Data.WritingOptions.atomicWrite)
            }
        } catch {
            print(error)
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
