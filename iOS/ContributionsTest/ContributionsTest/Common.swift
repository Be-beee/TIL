//
//  Common.swift
//  ContributionsTest
//
//  Created by 서보경 on 2020/11/27.
//

import UIKit

struct UserContributions {
    var total: Int = 0
    var userID: String = "Be-beee"
    var commitHistory: [UserCommitData] = []
}

enum Tag {
    case h2, rect, none
}

class ContributionsParser: NSObject, XMLParserDelegate {
    // https://github.com/users/Be-beee/contributions
    // rest api
    // get contributions
    // rect -> data-count, data-date
    // h2 -> total commit counts (last year)
    
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
