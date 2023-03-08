//
//  LoginView.swift
//  CombineMVVMEx
//
//  Created by 서보경 on 2023/03/08.
//

import UIKit

final class LoginView: UIView {
    // MARK: - UI Properties
    
    private(set) var idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        
        return textField
    }()
    
    private(set) var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(.systemBackground, for: .normal)
        button.backgroundColor = .systemGray3
        
        return button
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    // MARK: - Properties
    
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func configure() {
        configureBackgroundColor()
        configureViews()
        configureConstraints()
    }
    
    private func configureBackgroundColor() {
        backgroundColor = .systemBackground
    }
    
    private func configureViews() {
        [idTextField, passwordTextField, loginButton].forEach { view in
            stackView.addArrangedSubview(view)
        }
        
        addSubview(stackView)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30)
        ])
    }
    
    // MARK: - Load Data Function
    
    func loadLoginInfo() -> String {
        let info = "id: \(idTextField.text ?? .empty), pw: \(passwordTextField.text ?? .empty)"
        
        return info
    }
    
}
