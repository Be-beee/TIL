//
//  ViewModelType.swift
//  CombineMVVMEx
//
//  Created by 서보경 on 2023/03/08.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
