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
    
    private let user = PassthroughSubject<String, Never>()
    private let password = PassthroughSubject<String, Never>()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind(to: viewModel)
        configureActions()
    }
    
    // MARK: - Configure Action Function

    private func configureActions() {
        rootView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        rootView.idTextField.addTarget(self, action: #selector(textFieldDidChange(sender:)), for: .editingChanged)
        rootView.passwordTextField.addTarget(self, action: #selector(textFieldDidChange(sender:)), for: .editingChanged)
    }
    
    @objc private func loginButtonTapped() {
        print(rootView.loadLoginInfo())
    }
    
    @objc private func textFieldDidChange(sender: UITextField) {
        switch sender {
        case rootView.idTextField:
            user.send(sender.text!)
        case rootView.passwordTextField:
            password.send(sender.text!)
        default:
            break
        }
    }
    
    // MARK: - Bind Functions
    
    private func bind(to viewModel: LoginViewModel) {
        let input = LoginViewModel.Input(
            userName: user.eraseToAnyPublisher(),
            password: password.eraseToAnyPublisher()
        )
        
        let output = viewModel.transform(input: input)
        
        output.buttonIsValid
            .sink { [weak self] state in
                self?.rootView.loginButton.isEnabled = state
                self?.rootView.loginButton.backgroundColor = state ? .systemBlue : .systemGray3
            }
            .store(in: &cancellables)
    }
    
}

