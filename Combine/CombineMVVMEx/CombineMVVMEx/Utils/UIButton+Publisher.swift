//
//  UIButton+Publisher.swift
//  CombineMVVMEx
//
//  Created by 서보경 on 2023/03/09.
//

import Combine
import UIKit

extension UIButton {
    var publihser: AnyPublisher<Void, Never> {
        controlPublisher(for: .touchUpInside)
            .map { _ in }
            .eraseToAnyPublisher()
    }
}
