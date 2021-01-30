//
//  HistoryTableViewCell.swift
//  IOS-Mobile-Dev-1-Assignment-2-Week-6
//
//  Created by ADMIN ODoYal on 30.01.2021.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    @IBOutlet weak var quizNameLabel: UILabel!
    @IBOutlet weak var quizScoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with item:Quiz){
        self.quizNameLabel.text = item.attemtTitle
        self.quizScoreLabel.text = String(item.totalPoint)+"/"+String(item.questionCount)
        self.setCellColor(item.totalPoint, item.questionCount)
    }
    
    private func setCellColor(_ totalPoint: Int,_ questionCount: Int){
        let percentageScore = Int(totalPoint/questionCount*100)
        if percentageScore > 100 || percentageScore < 0{
            contentView.backgroundColor = .darkGray
        }else{
            if percentageScore >= 90{
                contentView.backgroundColor = .green
            }else if (percentageScore >= 70 )&&(percentageScore < 90 )  {
                contentView.backgroundColor = .systemYellow
            }else if (percentageScore >= 50 )&&(percentageScore < 70 )  {
                contentView.backgroundColor = .orange
            }else if (percentageScore >= 25 )&&(percentageScore < 50 )  {
                contentView.backgroundColor = .red
            }else{
                contentView.backgroundColor = .systemRed
            }
        }
    }
}
