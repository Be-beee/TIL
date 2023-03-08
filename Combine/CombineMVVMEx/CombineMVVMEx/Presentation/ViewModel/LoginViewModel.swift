//
//  LoginViewModel.swift
//  CombineMVVMEx
//
//  Created by 서보경 on 2023/03/08.
//

import Combine
import Foundation

final class LoginViewModel: ViewModelType {
    struct Input {
        let userName: AnyPublisher<String, Never>
        let password: AnyPublisher<String, Never>
    }
    
    struct Output {
        let buttonIsValid: AnyPublisher<Bool, Never>
    }
    
    func transform(input: Input) -> Output {
        let buttonStatePublisher = input.userName.combineLatest(input.password)
            .map { user, password in
                user.count >= 4 && password.count >= 6
            }
            .eraseToAnyPublisher()
        
        return Output(buttonIsValid: buttonStatePublisher)
    }
}
