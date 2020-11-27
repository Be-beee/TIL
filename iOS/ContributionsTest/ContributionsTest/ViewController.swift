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
        // Do any additional setup after loading the view.
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
//            xmlParser.delegate = self
//            xmlParser.parse()
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

    // https://github.com/users/Be-beee/contributions
    // rest api
    // get contributions
    // rect -> data-count, data-date
    // h2 -> total commit counts (last year)
    
}

extension ViewController: UITableViewDelegate {
    
}

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

extension ViewController: XMLParserDelegate {
    
}

class CommitCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
}

struct UserContributions {
    var total: Int = 0
    var userID: String = "Be-beee"
    var commitHistory: [UserCommitData] = []
}

class ContributionsParser: NSObject, XMLParserDelegate {
    var userContributions = UserContributions()
    var tag: Tag = .none
    var totalString = ""
    override init() {
        super.init()
    }
    
    init(data: Data) {
        super.init()
        let parser = XMLParser(data: data)
        parser.delegate = self
        parser.parse()
        getTotal()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if elementName == "h2" {
            tag = .h2
        } else if elementName == "rect" {
            tag = .rect
            if let date = attributeDict["data-date"], let count = attributeDict["data-count"] {
                let commitData = (date: date, count: Int(count) ?? 0)
                userContributions.commitHistory.insert(commitData, at: 0)
            }
        } else {
            tag = .none
        }
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if tag == .h2 {
            totalString += string
        }
    }
    
    func getTotal() {
        let tmp = totalString.components(separatedBy: " ").filter{ $0 != "" && $0 != "\n" }
        userContributions.total = Int(tmp[0]) ?? 0
    }
}
enum Tag {
    case h2, rect, none
}
