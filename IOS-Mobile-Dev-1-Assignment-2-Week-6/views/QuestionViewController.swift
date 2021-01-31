//
//  QuestionViewController.swift
//  IOS-Mobile-Dev-1-Assignment-2-Week-6
//
//  Created by ADMIN ODoYal on 28.01.2021.
//

import UIKit

class QuestionViewController: UIViewController{
    var questionArray = [Question](arrayLiteral:
    Question(questionText: "4 x 4 = ?", answereList: ["1","4","8","16"], correctAnswere: 4,answer: nil,  isAnswered: false),
    Question(questionText: "20 % of 2 is equal to", answereList: ["0.02","0.2","0.4","0.04"], correctAnswere: 3,answer: nil,  isAnswered: false),
    Question(questionText: "Which of these is the Worst-case time complexity of Quick Sort - and cannot be expressed in lower order terms ?", answereList: ["O(n log n)","O(n)","O(n2)","O(n3)"], correctAnswere: 2,answer: nil,  isAnswered: false),
    Question(questionText: "Which of these is the worst case time complexity of Merge Sort - and cannot be expressed in lower order terms ?", answereList: ["O(n log n)","O(n)","O(n2)","O(n3)"], correctAnswere: 1,answer: nil,  isAnswered: false),
    Question(questionText: "Which of these is the average case time complexity of Merge Sort - and cannot be expressed in lower order terms ?", answereList: ["O(n log n)","O(n)","O(n2)","O(n3)"], correctAnswere: 3,answer: nil,  isAnswered: false),
    Question(questionText: "Which of these is the time complexity involved in building a heap of n elements - and cannot be expressed in lower order terms ?", answereList: ["O(n log n)","O(n)","O(n2)","O(n3)"], correctAnswere: 4,answer: nil,  isAnswered: false),
    Question(questionText: "A union find data-structure is commonly applied while implementing: ", answereList: ["A depth-first search traversal of a graph.","A breadth-first search traversal of a graph.","Computing the minimum spanning tree of a graph using the Kruskal algorithm.","Computing the all-pairs shortest path in a graph."], correctAnswere: 2,answer: nil,  isAnswered: false),
    Question(questionText: "Which of these is the worst case time complexity for looking up a key in a binary search tree - and cannot be expressed in lower order terms ?", answereList: ["O(n log n)","O(n)","O(n2)","O(n3)"], correctAnswere: 4,answer: nil,  isAnswered: false),
    Question(questionText: "Of 20 rats in a laboratory, 12 are males and 9 are infected with a virus. Of the 12 male rats, 7 infected with the virus. One rat is randomly selected from the laboratory. If the selected rat is found to be a male, what is the probability that it is infected?", answereList: ["7/12","7/20","11/20","12/20"], correctAnswere: 1,answer: nil,  isAnswered: false),
    Question(questionText: "Suppose that P(A)=0.48 , P(B)=0.62 , and P(A AND B)=0.28 . Find the conditional probability that B does not occur, given that A occurs.", answereList: ["0.417","0.583","0.432","0.524"], correctAnswere: 2,answer: nil,  isAnswered: false))
    
    var currentQuestion = 0
    var quizPoint = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionItemNavigatorLabel: UILabel!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    
    @IBAction func answerAction(_ sender: AnyObject) {
        let button = sender as! UIButton
        self.questionArray[self.currentQuestion].answer = button.tag
        if sender.tag == self.questionArray[currentQuestion].correctAnswere{
            self.quizPoint += 1
        }
        self.questionArray[self.currentQuestion].isAnswered = true
        setQuestion()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setQuestion()
    }
    
    @IBOutlet weak var nextPageButton: UIButton!
    @IBAction func nextPage(_ sender: Any) {
        if areAllAnswered()  {
            let vc = self.storyboard?.instantiateViewController(identifier: "ResultViewController") as! ResultViewController
            vc.totalPoint = self.quizPoint
            vc.questionCount = self.questionArray.count
            vc.questionArray = self.questionArray
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if self.currentQuestion != self.questionArray.count-1 {
            self.currentQuestion += 1
            setQuestion()
        }
    }
    
    @IBAction func previusPage(_ sender: AnyObject) {
        if self.currentQuestion > 0 {
            self.currentQuestion -= 1
        }
        setQuestion()
    }
    
    @IBAction func exitFromGame(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func areAllAnswered() -> Bool {
        for question in self.questionArray {
            if question.isAnswered == false{
                return false
            }
        }
        return true
    }
    
    func setQuestion() {
        questionLabel.text = self.questionArray[self.currentQuestion].questionText
        questionItemNavigatorLabel.text = String(self.currentQuestion+1)+"/"+String(self.questionArray.count)
        var button:UIButton = UIButton()
        if areAllAnswered()  {
            nextPageButton.setTitle("Finish", for: .normal)
        }
        for i in 0...3 {
            button = view.viewWithTag(i+1) as! UIButton
            button.setTitle(self.questionArray[currentQuestion].answereList[i], for: .normal)
            button.backgroundColor = .systemGray5
            if self.questionArray[self.currentQuestion].isAnswered == true {
                button.isEnabled = false
                if button.tag == self.questionArray[self.currentQuestion].answer{
                    button.backgroundColor = .red
                }
                if button.tag == self.questionArray[self.currentQuestion].correctAnswere{
                    button.backgroundColor = .green
                }
            }else{
                button.isEnabled = true
                button.backgroundColor = .systemGray5
            }
        }
    }
}
