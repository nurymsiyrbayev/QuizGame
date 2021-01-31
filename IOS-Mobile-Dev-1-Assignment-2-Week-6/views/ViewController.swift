//
//  ViewController.swift
//  IOS-Mobile-Dev-1-Assignment-2-Week-6
//
//  Created by ADMIN ODoYal on 26.01.2021.
//

import UIKit

class ViewController: UIViewController {    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.animateBackgroundColor()
        self.title = "Home Page"
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func showHistoryButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "HistoryViewController") as! HistoryViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func playButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "QuestionViewController") as! QuestionViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func animateBackgroundColor() {
        UIView.animate(withDuration: 0.4,animations: {
            self.view.backgroundColor = UIColor.init(red: 251/256, green: 171/256, blue: 154/256, alpha: 1.0)
        },  completion:{ (completed: Bool) -> Void in
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                self.view.backgroundColor = .systemBlue
            },  completion:{ (completed: Bool) -> Void in
                    UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
                        self.view.backgroundColor = .white
                })
            })
        })
    }
}

