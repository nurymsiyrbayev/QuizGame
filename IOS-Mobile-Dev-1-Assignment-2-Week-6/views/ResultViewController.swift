//
//  ResultViewController.swift
//  IOS-Mobile-Dev-1-Assignment-2-Week-6
//
//  Created by ADMIN ODoYal on 30.01.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var result: UILabel!
    var totalPoint:Int?
    var questionCount:Int?
    var questionArray:[Question]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.animateBackgroundColor()
        HystorySingleton.shared.addNewQuiz(Quiz.init(attemtTitle: String(HystorySingleton.shared.quizHystory.count)+"attemt", totalPoint: totalPoint ?? 1, questionCount: questionCount ?? 1, questionArray: questionArray))
        self.title = "Result Page"
        self.result.text = String(totalPoint ?? 0)+"/"+String(questionCount ?? 0)
    }
    
    @IBAction func tryAgain(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "QuestionViewController") as! QuestionViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func showHomePage(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func animateBackgroundColor() {
        let percentageScore = Int((self.totalPoint ?? 10) * 100/(self.questionCount ?? 1))
        if percentageScore > 100 || percentageScore < 0{
            UIView.animate(withDuration: 0.4,animations: {
                self.view.backgroundColor = .darkGray
            },  completion:{ (completed: Bool) -> Void in
                UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                    self.view.backgroundColor = .systemGray5
                })
            })
        }else{
            if percentageScore >= 90{
                UIView.animate(withDuration: 0.4,animations: {
                    self.view.backgroundColor = UIColor.init(red: 191/256, green: 255/256, blue: 166/256, alpha: 1.0)
                },  completion:{ (completed: Bool) -> Void in
                    UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                        self.view.backgroundColor = .white
                    })
                })
            }else if percentageScore >= 70 && percentageScore < 90 {
                UIView.animate(withDuration: 0.4,animations: {
                    self.view.backgroundColor = UIColor.init(red: 230/256, green: 255/256, blue: 156/256, alpha: 1.0)
                },  completion:{ (completed: Bool) -> Void in
                    UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                        self.view.backgroundColor = .white
                    })
                })
            }else if percentageScore >= 50 && percentageScore < 70 {
                UIView.animate(withDuration: 0.4,animations: {
                    self.view.backgroundColor = UIColor.init(red: 255/256, green: 255/256, blue: 199/256, alpha: 1.0)
                },  completion:{ (completed: Bool) -> Void in
                    UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                        self.view.backgroundColor = .white
                    })
                })
            }else if percentageScore >= 25 && percentageScore < 50 {
                UIView.animate(withDuration: 0.4,animations: {
                    self.view.backgroundColor = UIColor.init(red: 255/256, green: 193/256, blue: 166/256, alpha: 1.0)
                },  completion:{ (completed: Bool) -> Void in
                    UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                        self.view.backgroundColor = .white
                    })
                })
            }else{
                UIView.animate(withDuration: 0.4,animations: {
                    self.view.backgroundColor = UIColor.init(red: 255/256, green: 60/256, blue: 46/256, alpha: 1.0)
                },  completion:{ (completed: Bool) -> Void in
                    UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                        self.view.backgroundColor = .white
                    })
                })
            }
        }
        
    }
}
