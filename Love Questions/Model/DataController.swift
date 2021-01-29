//
//  DataController.swift
//  Love Questions
//
//  Created by Maciej Sienkiewicz on 21/01/2021.
//

import Foundation

class DataController {
    
    private let file = "LoveQuestionsData"
    private let fileManager = FileManager()
    
    var questionsSets = [QuestionsSet]()
    
    init() {
        if let fileURL = url(forFileNamed: file), !fileManager.fileExists(atPath: fileURL.path) {
            fileManager.createFile(atPath: fileURL.path, contents: "[]".data(using: .utf8), attributes: [FileAttributeKey.type: "json"])
        }
        
        if let localData = readLocalFile(withName: file), let decodedData = parse(jsonData: localData) {
            self.questionsSets = decodedData
        }
    }
    
    public func persistData(withSets sets: [QuestionsSet]) {
        if let encodedData = parse(sets: sets) {
            writeLocalFile(withName: file, data: encodedData)
            self.questionsSets = sets
        }
    }
    
    private func writeLocalFile(withName name: String, data: Data) {
        do {
            if let fileURL = url(forFileNamed: name) {
                try data.write(to: fileURL)
            }
        } catch {
            print(error)
        }
    }
    
    private func readLocalFile(withName name: String) -> Data? {
        do {
            if let fileURL = url(forFileNamed: name), let jsonData = try String.init(contentsOf: fileURL).data(using: .utf8) {
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
    
    private func parse(sets: [QuestionsSet]) -> Data? {
        do {
            return try JSONEncoder().encode(sets)
        } catch {
            print(error)
        }
        
        return nil
    }
    
    private func url(forFileNamed fileName: String) -> URL? {
        guard let url = fileManager.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first else {
            return nil
        }
        return url.appendingPathComponent(fileName)
    }

}
