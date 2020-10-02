//
//  ViewController.swift
//  CollectionView_Custom
//
//  Created by 서보경 on 2020/09/12.
//  Copyright © 2020 서보경. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var carouselView: UICollectionView!
    var list: [UIImage] = []
    let cellSize = CGSize(width: UIScreen.main.bounds.width - 90, height: 220)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureList()
        configureCarouselView()
    }
    
    func configureList() {
        for i in 1 ... 8 {
            list.append(UIImage(named: "\(i)") ?? UIImage())
        }
    }
    
    func configureCarouselView() {
        carouselView.contentInsetAdjustmentBehavior = .never
        carouselView.contentInset = UIEdgeInsets(top: 0, left: 45, bottom: 0, right: 110)
        // line spacing 10.0 (default) -> 20.0 / EdgeInsets right 45 -> 110
        carouselView.decelerationRate = .fast
    }
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let width = cellSize.width + 20 // width + minimum line spacing

        var offset = targetContentOffset.pointee
        let tmpIndex = (offset.x + scrollView.contentInset.left) / width
        // tmpIndex: (드래그가 끝난 위치값 + left index 값)/페이지 너비
        // left inset 값을 추가하여 드래그를 용이하게 함
//        let tmpIndex = offset.x / width
        
        let index: CGFloat = round(tmpIndex)
        // tmpIndex 반올림, 몇 번째 페이지로 이동되는지 결정됨
        // 셀 너비의 반 이상 드래그 했을 때 다음 페이지로 이동된다 (if tmpIndex >= 0.5 -> index = 1.0)

        offset = CGPoint(x: index * width - scrollView.contentInset.left, y: scrollView.contentInset.top)
        // 다음 x좌표 결정, (순서 * 페이지 너비)의 위치로 이동함
        // 이 때 left inset 값을 빼주지 않으면 화면의 맨 왼쪽으로 페이지가 달라 붙음
        // 다음 페이지가 화면 중앙에 오도록 인셋값을 빼서 이전 페이지의 일부가 표시되도록 함
        
        targetContentOffset.pointee = offset
    }
}

extension ViewController: UICollectionViewDelegate {}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = carouselView.dequeueReusableCell(withReuseIdentifier: "SampleCell", for: indexPath) as! SampleCell
        cell.backgroundColor = .darkGray
        
        cell.imgView.translatesAutoresizingMaskIntoConstraints = false
        cell.imgView.widthAnchor.constraint(equalToConstant: cellSize.width).isActive = true
        cell.imgView.heightAnchor.constraint(equalToConstant: cellSize.height).isActive = true
        cell.imgView.centerXAnchor.constraint(equalTo: cell.contentView.centerXAnchor).isActive = true
        cell.imgView.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor).isActive = true
        
        cell.imgView.image = list[indexPath.row]
        
        return cell
    }
    
    
}
