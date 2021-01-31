//
//  UserHistory.swift
//  IOS-Mobile-Dev-1-Assignment-2-Week-6
//
//  Created by ADMIN ODoYal on 31.01.2021.
//

import Foundation

class HistorySingleton {
    var quizHistory = [Quiz(attemtTitle: "", totalPoint: 1, questionCount: 1, questionArray: [Question(questionText: "", answereList: [""], correctAnswere: 1, answer: nil, isAnswered: false)])]
    
    static var shared: HistorySingleton = {
            let instance = HistorySingleton()
            instance.quizHistory.remove(at: 0)
            return instance
        }()
    
    private init() {}
    
    func addNewQuiz(_ item: Quiz){
        quizHistory.append(item)
    }
}
