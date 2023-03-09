//
//  LoginViewController.swift
//  CombineMVVMEx
//
//  Created by 서보경 on 2023/03/08.
//

// 참고: https://velog.io/@aurora_97/Combine-UIKit-MVVM-Combine-예제

import Combine
import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - UI Properties
    
    private let rootView = LoginView()
    
    // MARK: - Properties
    
    private var cancellables = Set<AnyCancellable>()
    private let viewModel = LoginViewModel()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind(to: viewModel)
    }
    
    // MARK: - Bind Functions
    
    private func bind(to viewModel: LoginViewModel) {
        let input = LoginViewModel.Input(
            userName: rootView.idTextField.publisher.eraseToAnyPublisher(),
            password: rootView.passwordTextField.publisher.eraseToAnyPublisher(),
            loginButtonTapped: rootView.loginButton.publihser.eraseToAnyPublisher()
        )
        
        let output = viewModel.transform(input: input)
        
        output.buttonIsValid
            .sink { [weak self] state in
                self?.rootView.loginButton.isEnabled = state
                self?.rootView.loginButton.backgroundColor = state ? .systemBlue : .systemGray3
            }
            .store(in: &cancellables)
        
        output.loginInfo
            .sink { info in
                print(info)
            }
            .store(in: &cancellables)
    }
    
}

