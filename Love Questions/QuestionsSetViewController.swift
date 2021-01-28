//
//  ViewController.swift
//  Love Questions
//
//  Created by Maciej Sienkiewicz on 16/01/2021.
//

import Foundation
import UIKit

class QuestionsSetViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var questionView: UIView!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var nextQuestionButton: UIButton!
    
    var questionsSet: QuestionsSet?
    var currentQuestion: Question?
    
    public func setup(with set: QuestionsSet?) {
        self.questionsSet = set
        self.currentQuestion = self.questionsSet?.nextQuestion()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = self.questionsSet?.name
        self.updateQuestionView()
    }

    //MARK: Actions
    @IBAction func showNextQuestion(_ sender: Any) {
        self.currentQuestion = self.questionsSet?.nextQuestion()
        self.updateQuestionView()
    }

    private func updateQuestionView() {
        if self.questionsSet == nil {
            questionText.text = "No set of questions"
            questionNumber.text = "?"
        } else if self.currentQuestion == nil {
            questionText.text = "No question"
            questionNumber.text = "?"
        } else {
            questionText.text = self.currentQuestion!.text
            questionNumber.text = "#\(self.currentQuestion!.number)"
        }
        questionView.updateConstraints()
    }
}

