//
//  ViewController.swift
//  Love Questions
//
//  Created by Maciej Sienkiewicz on 16/01/2021.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var questionView: UIView!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var nextQuestionButton: UIButton!
    
    let questionsSet = QuestionsSet()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        questionView.layer.shadowColor = UIColor.black.cgColor
        questionView.layer.shadowOpacity = 0.3
        questionView.layer.shadowOffset = .zero
        questionView.layer.cornerRadius = 8
        questionView.layer.shadowRadius = 8

        if (self.questionsSet) != nil {
            questionText.text = self.questionsSet!.questions.first?.text
        } else {
            questionText.text = "Eror"
        }
    }

    //MARK: Actions
    @IBAction func showNextQuestion(_ sender: Any) {
        questionText.text = self.questionsSet?.nextQuestion().text
    }

}

