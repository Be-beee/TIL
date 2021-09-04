//
//  ViewController.swift
//  CustomCalendarView
//
//  Created by 서보경 on 2021/09/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calendarTitle: UILabel!
    @IBOutlet weak var calendarView: UICollectionView!
    
    var dateList: [Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy MM dd EEE"
        print(dateformatter.string(from: Date()))
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
