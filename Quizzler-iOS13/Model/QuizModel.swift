import Foundation

struct QuizModel {
    let questions = [
        Question("Which is the largest organ in the human body?", ["Heart", "Skin", "Large intestine"], correctAnswer: "Skin"),
        Question("Five dollars is worth how many nickels?", ["25", "50", "100"], correctAnswer: "100"),
        Question("What do the letters in the GMT time zone stand for?", ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question("What is the French word for 'hat'?", ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question("In past times, what would a gentleman keep in his fob pocket?", ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question("How would one say goodbye in Spanish?", ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question("Which of these colours is NOT featured in the logo for Google?", ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question("What alcoholic drink is made from molasses?", ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question("What type of animal was Harambe?", ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question("Where is Tasmania located?", ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    var questionIndex = 0
    
    var score = 0
    
    func getQuestionText() -> String {
        return questions[questionIndex].text
    }
    
    func getChoices() -> [String] {
        return questions[questionIndex].choices
    }
    
    func getProgress() -> Float {
        return Float(questionIndex + 1) / Float(questions.count)
    }
    
    func getScore() -> Int {
        return score;
    }
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == questions[questionIndex].correctAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    mutating func nextQuestion() {
        if questionIndex < questions.count - 1 {
            questionIndex += 1
        } else {
            questionIndex = 0
            score = 0
        }
    }
}
