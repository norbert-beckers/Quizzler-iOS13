//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    @IBOutlet weak var choice3Button: UIButton!
    
    var quizModel = QuizModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    fileprivate func updateQuestion() {
        questionLabel.text = quizModel.getQuestionText()
        let choices = quizModel.getChoices()
        choice1Button.setTitle(choices[0], for: .normal)
        choice2Button.setTitle(choices[1], for: .normal)
        choice3Button.setTitle(choices[2], for: .normal)
        choice1Button.backgroundColor = UIColor.clear
        choice2Button.backgroundColor = UIColor.clear
        choice3Button.backgroundColor = UIColor.clear
    }
    
    fileprivate func updateScore() {
        scoreLabel.text = "Score \(quizModel.getScore())"
    }
    
    fileprivate func updateProgress() {
        progressBar.progress = quizModel.getProgress()
    }
    
    @objc func updateUI() {
        updateQuestion()
        updateScore()
        updateProgress()
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        let answerGiven = sender.currentTitle!
        
        if quizModel.checkAnswer(answerGiven) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }   
        
        quizModel.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
}
