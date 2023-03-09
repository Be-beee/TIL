//
//  UITextField+Publisher.swift
//  CombineMVVMEx
//
//  Created by 서보경 on 2023/03/09.
//

import Combine
import UIKit

extension UITextField {
    var publisher: AnyPublisher<String, Never> {
        controlPublisher(for: .editingChanged)
            .map { $0 as! UITextField }
            .map { $0.text ?? .empty }
            .eraseToAnyPublisher()
    }
}
