//
//  UserHistory.swift
//  IOS-Mobile-Dev-1-Assignment-2-Week-6
//
//  Created by ADMIN ODoYal on 31.01.2021.
//

import Foundation

class HystorySingleton {
    var quizHystory = [Quiz(attemtTitle: "", totalPoint: 1, questionCount: 1, questionArray: [Question(questionText: "", answereList: [""], correctAnswere: 1, answer: nil, isAnswered: false)])]
    
    static var shared: HystorySingleton = {
            let instance = HystorySingleton()
            instance.quizHystory.remove(at: 0)
            return instance
        }()
    
    private init() {}
    
    func addNewQuiz(_ item: Quiz){
        quizHystory.append(item)
    }
}
