//
//  QuizLoader.swift
//  Quiz game
//
//  Created by ofcstudent on 6/9/17.
//  Copyright © 2017 ofcstudent. All rights reserved.
//

import Foundation

struct MultipleChoiceQuestion {
    let question: String
    let correctAnswer: String
    let answers: [String]
}

enum LoaderError: Error{
case dictionaryFailed, pathFailed
}

class QuizLoader{
    public func loadMultipleChoiceQuiz(forQuiz quizName:String) throws -> MultipleChoiceQuestion{
        var questions = [MultipleChoiceQuestion]()
        if let path = Bundle.main.path(forResource: quizName, ofType: "plist") {
            if let dict = NSDictionary(contentsOfFile: path) {
                let tempArray: Array = dict["Questions"]! as! [Dictionary<String,AnyObject>]
                for dictionary in tempArray {
                    let questionToAdd = MultipleChoiceQuestion(question: dictionary["Question"] as! String, correctAnswer: dictionary ["CorrectAnswer"] as! String, answers: dictionary ["Answers"] as! [String])
                    questions.append(questionToAdd)
                }
                
                return questions
                
            }
            else{
                throw LoaderError.dictionaryFailed
            }
        }
            else{
            throw LoaderError.pathFailed
        }
}
}
