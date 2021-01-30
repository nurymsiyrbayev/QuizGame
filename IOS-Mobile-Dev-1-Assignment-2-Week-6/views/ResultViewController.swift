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
    let questionArray:[Question]? = nil
    
    weak var delegate: ResultViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Result Page"
        delegate?.addNewAttemt(totalPoint ?? 0, questionCount ?? 0, questionArray ?? [Question(questionText: "question", answereList: ["?"], correctAnswere: 0, answer: nil, isAnswered: true)])
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
}
