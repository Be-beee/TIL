//
//  ViewController.swift
//  ExpandCellAtLabel
//
//  Created by 서보경 on 2020/09/22.
//

import UIKit

class ExpandCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // expand 상태
    // Model
    
    struct ExpandDataModel {
        var description: String
        var isExpand: Bool
    }
    
    var dataModels: [ExpandDataModel] = []

    @IBOutlet weak var sampleTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textArray = [
            "short text",
            "long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long text",
            "short text",
            "long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long text",
            "short text",
            "long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long text",
            "long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long text"
        ]
        for (_, value) in textArray.enumerated() {
            dataModels.append(ExpandDataModel.init(description: value, isExpand: false))
        }
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return dataModels[indexPath.row].isExpand ? 300 : 150
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sampleTable.dequeueReusableCell(withIdentifier: "expandCell_ID", for: indexPath) as! ExpandCell
        
        cell.descriptionLabel.text = dataModels[indexPath.row].description
        
        if dataModels[indexPath.row].isExpand {
            cell.descriptionLabel.numberOfLines = 0
        } else {
            cell.descriptionLabel.numberOfLines = 1
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataModels[indexPath.row].isExpand.toggle()
        
        
        // 셀 애니메이션 퍼포먼스 저하 발생 시
        // 1. heightForRowAt 에서 정확한 높이를 지정 - 확실한 해결
        // 2. tableView.reloadData() - 어느정도 해결
        // 3. headerheight/footerheight 지정
        //sampleTable.estimatedSectionHeaderHeight = 0
        //sampleTable.estimatedSectionFooterHeight = 0
        
        // 4. 애니메이션 효과 없애기 - 확실한 해결
        
        sampleTable.reloadRows(at: [indexPath], with: .none)
    }
    
}

