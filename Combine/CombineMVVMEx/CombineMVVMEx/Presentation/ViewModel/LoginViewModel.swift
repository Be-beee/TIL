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
        let loginButtonTapped: AnyPublisher<Void, Never>
    }
    
    struct Output {
        let buttonIsValid: AnyPublisher<Bool, Never>
        let loginInfo: AnyPublisher<String, Never>
    }
    
    func transform(input: Input) -> Output {
        let buttonStatePublisher = input.userName.combineLatest(input.password)
            .map { user, password in
                user.count >= 4 && password.count >= 6
            }
            .eraseToAnyPublisher()
        
        let loginButtonTapPublisher = input.loginButtonTapped.combineLatest(input.userName, input.password)
            .map { _, userName, password in
                "userName: \(userName), password: \(password)"
            }
            .eraseToAnyPublisher()
        
        return Output(
            buttonIsValid: buttonStatePublisher,
            loginInfo: loginButtonTapPublisher
        )
    }
}
