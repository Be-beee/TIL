//
//  ViewController.swift
//  ContributionsTest
//
//  Created by 서보경 on 2020/11/26.
//

import UIKit

typealias UserCommitData = (date: String, count: Int)
class ViewController: UIViewController {

    var userContributions: UserContributions?
    var commitsList: [UserCommitData] = []
    @IBOutlet weak var userId: UILabel!
    @IBOutlet weak var totalCountLabel: UILabel!
    @IBOutlet weak var commitListView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callAPI()
    }
    func callAPI() {
        guard let url = URL(string: "https://github.com/users/Be-beee/contributions") else { return }
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            let success = 200 ..< 300
            guard error == nil, let statusCode = (response as? HTTPURLResponse)?.statusCode, success.contains(statusCode) else { return }
            guard let result = data else { return }
            let parser = ContributionsParser(data: result)
            DispatchQueue.main.async {
                self.userContributions = parser.userContributions
                self.userId.text = self.userContributions?.userID
                self.totalCountLabel.text = String(self.userContributions?.total ?? 0)
                self.commitsList = self.userContributions?.commitHistory ?? []
                self.commitListView.reloadData()
            }
        }
        dataTask.resume()
    }
}

extension ViewController: UITableViewDelegate {}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commitsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = commitListView.dequeueReusableCell(withIdentifier: "commitCell", for: indexPath) as? CommitCell else { return UITableViewCell() }
        cell.dateLabel.text = commitsList[indexPath.row].date
        cell.countLabel.text = String(commitsList[indexPath.row].count)
        
        return cell
    }
}


