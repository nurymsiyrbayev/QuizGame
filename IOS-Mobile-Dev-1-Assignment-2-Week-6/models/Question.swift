//
//  Question.swift
//  IOS-Mobile-Dev-1-Assignment-2-Week-6
//
//  Created by ADMIN ODoYal on 28.01.2021.
//

import Foundation

public struct Question {
    let questionText: String
    let answereList: [String]
    let correctAnswere: Int
    var answer: Int?
    var isAnswered: Bool
}
