//
//  HistoryTableViewController.swift
//  IOS-Mobile-Dev-1-Assignment-2-Week-6
//
//  Created by ADMIN ODoYal on 30.01.2021.
//

import UIKit

protocol ResultViewControllerDelegate:class {
    func addNewAttemt(_ totalPoint: Int,_ questionCount: Int,_ questionArray:[Question])
}

extension HistoryViewController: ResultViewControllerDelegate{
    func addNewAttemt(_ totalPoint: Int, _ questionCount: Int, _ questionArray: [Question]) {
        attemts.append(Quiz(attemtTitle: String(attemts.count)+"attemt", totalPoint: totalPoint, questionCount: questionCount, questionArray: questionArray))
        historyTableView.reloadData()
    }
}

class HistoryViewController: UIViewController{
    var attemts = [Quiz]()
    @IBOutlet weak var historyTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "History Page"
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func configure() {
        historyTableView.delegate = self
        historyTableView.dataSource = self
        historyTableView.tableFooterView = UIView()
        historyTableView.register(UINib(nibName: "HistoryTableViewCell", bundle: nil), forCellReuseIdentifier: "HistoryTableViewCell")
    }
}

extension HistoryViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attemts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath) as! HistoryTableViewCell
        let item = attemts[indexPath.row]
        cell.configure(with: item)
        return cell
    }
}
