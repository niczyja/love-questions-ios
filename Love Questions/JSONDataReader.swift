//
//  JSONDataReader.swift
//  Love Questions
//
//  Created by Maciej Sienkiewicz on 17/01/2021.
//

import Foundation

struct QuestionData: Codable {
    let number: Int
    let text: String
}

func readLocalFile(withName name: String) -> Data? {
    do {
        if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"), let jsonData = try String.init(contentsOfFile: bundlePath).data(using: .utf8) {
            return jsonData
        }
    } catch {
        print(error)
    }
    
    return nil
}

func parse(jsonData: Data) -> [QuestionData]? {
    do {
        return try JSONDecoder().decode([QuestionData].self, from: jsonData)
    } catch {
        print(error)
    }
    
    return nil
}
