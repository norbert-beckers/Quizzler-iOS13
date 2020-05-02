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
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!

    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizModel = QuizModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @objc func updateUI() {
        questionLabel.text = quizModel.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        scoreLabel.text = "Score \(quizModel.getScore())"
        progressBar.progress = quizModel.getProgress()
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
