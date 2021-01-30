//
//  ViewController.swift
//  IOS-Mobile-Dev-1-Assignment-2-Week-6
//
//  Created by ADMIN ODoYal on 26.01.2021.
//

import UIKit

protocol ResultViewControllerDelegate:class {
    func addNewAttemt(_ totalPoint: Int,_ questionCount: Int,_ questionArray:[Question])
}

extension ViewController: ResultViewControllerDelegate{
    func addNewAttemt(_ totalPoint: Int, _ questionCount: Int, _ questionArray: [Question]) {
        attemts.append(Quiz(attemtTitle: String(attemts.count)+"attemt", totalPoint: totalPoint, questionCount: questionCount, questionArray: questionArray))
    }
}

class ViewController: UIViewController {
    
    var attemts = [Quiz]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home Page"
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func animateBackgroundColor() {
        UIView.animate(withDuration: 0.5,animations: {
            self.view.backgroundColor = UIColor.init(red: 251/256, green: 171/256, blue: 154/256, alpha: 1.0)
        },  completion:{ (completed: Bool) -> Void in
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                self.view.backgroundColor = UIColor.init(red: 102/256, green: 153/256, blue: 239/256, alpha: 1.0)
            },  completion:{ (completed: Bool) -> Void in
                self.animateBackgroundColor()
            })
        })
    }
    
    @IBAction func showHistoryButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "HistoryTableViewController") as! HistoryTableViewController
        vc.attemts = self.attemts
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func playButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "QuestionViewController") as! QuestionViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

