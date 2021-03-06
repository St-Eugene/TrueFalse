//
//  QuestionsProvider.swift
//  TrueFalseStarter
//
//  Created by Work on 9/16/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
import GameKit

struct QuestionsProvider {
    
    var questions = [QuestionForm]()
    
    //Determine the number of questions per round
    var questionsPerRound = 0
    
    //Increment each time an answer provided is correct
    var correctAnswer = ""
    
    //Increment each time a question is asked
    var questionsAsked = 0
    
    //Increment each time a question is answered correctly
    var correctQuestions = 0
    
    var questionToDisplay : QuestionForm
    
    //Changes each time a question is asked and
    //used to inform the game which question to remove from the questions array
    var selectedIndex = 0
    
    var consumedIndexes: [Int] = []

let question1 = QuestionForm(withQuestion: "Выпивая какой напиток по утрам у вас есть шанс сбросить вес быстрее?", correctAnswer: "Вода", possibleChoices: ["Кисель","Пивко","Тосол", "Вода"])
let question2 = QuestionForm(withQuestion: "Правда ли то что выпивая воду в течении 9ти дней вы потратите каллории равные бегу 8ми км в день?", correctAnswer: "Да", possibleChoices: ["Нет","Та хрен его знает", "Да"])
let question3 = QuestionForm(withQuestion: "Помогает ли вода ускорять метаболизм?", correctAnswer: "Конечно", possibleChoices: ["Пффф, еще чего","Нет","Ну если чуть чуть", "Конечно"])
let question4 = QuestionForm(withQuestion: "Наш мозг состоит на ... % из воды ?", correctAnswer: "85", possibleChoices: ["9","100","50", "85"])
let question5 = QuestionForm(withQuestion: "Помогает ли обильное питье воды сбросить лишний вес?", correctAnswer: "Да, я уже похудел", possibleChoices: ["Всмысле?!?!Нет конечно","Не знаю","Мне плевать!", "Да, я уже похудел"])
let question6 = QuestionForm(withQuestion: "Снижает ли обильное питье воды риск заболеть сердечно-сосудистыми заболеваниями? ", correctAnswer: "Да, конечно", possibleChoices: ["При чем тут это?!","Аффтар, ты идиот?","Нет!", "Да, конечно"])
let question7 = QuestionForm(withQuestion: "Риск сердечного приступа уменьшается на ... % при выпивании 5ти стаканов воды в день", correctAnswer: "41", possibleChoices: ["100","0","Чушь, это бабкины выдумки", "41"])
let question8 = QuestionForm(withQuestion: "Станет ли кожа чище и влажнее если вы пьете воду регулярно?", correctAnswer: "Да, как попка младенца", possibleChoices: ["Нет, мне не поможет","А прыщи тоже уйдут?","Плевать, я пью колу", "Да, как попка младенца"])

    init() {
    
    //Collect all questions in questions array
    questions = [question1, question2, question3, question4, question5, question6, question7, question8]
    
    // Determine the number of rounds in the game
    questionsPerRound = questions.count
        
    //Initialize questionToDisplay property
    questionToDisplay = question1
    
    }
    
    mutating func pickQuestion() {
        selectedIndex = GKRandomSource.sharedRandom().nextInt(upperBound: questions.count)
        correctAnswer = questions[selectedIndex].correctAnswer
        questionToDisplay = questions[selectedIndex]
    }
    
    mutating func randomizedAnswerChoices() {
        let numberOfChoices = questionToDisplay.possibleChoices.count
        
        while consumedIndexes.count < numberOfChoices {
        
        let index = GKRandomSource.sharedRandom().nextInt(upperBound: numberOfChoices)
            
            if !consumedIndexes.contains(index)
            {
                consumedIndexes.append(index)
            }
        
        }
        
    }
    
}
