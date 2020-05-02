import Foundation

struct Question {
    let text: String
    let choices: [String]
    let correctAnswer: String
    
    init(_ text: String, _ choices: [String], correctAnswer: String) {
        self.text = text
        self.choices = choices
        self.correctAnswer = correctAnswer
    }
}
	
