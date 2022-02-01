//
//  LandingViewController.swift
//  EmojisApp
//
//  Created by Charles Prado on 01/02/2022.
//

import UIKit

class LandingViewController: UIViewController {
    
    // MARK: - SubViews
    private let randomEmojiButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get a random emoji", for: .normal)
        button.backgroundColor = .systemFill
        return button
    }()
    
    private let emojisButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Emojis", for: .normal)
        button.backgroundColor = .systemFill
        button.addTarget(nil, action: #selector(navigateToEmojis), for: .touchUpInside)
        return button
    }()
    
    private let reposButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Repositories", for: .normal)
        button.backgroundColor = .systemFill
        return button
    }()
    
    private let avatarsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Avatars", for: .normal)
        button.backgroundColor = .systemFill
        return button
    }()
    
    private let mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Emojis App"
        view.backgroundColor = .systemBackground
        view.addSubview(mainStackView)
        
        addSubviews()
        setUpConstraints()
    }
    
    // MARK: - Internal Methods
    private func addSubviews() {
        mainStackView.addArrangedSubview(randomEmojiButton)
        mainStackView.addArrangedSubview(emojisButton)
        mainStackView.addArrangedSubview(reposButton)
        mainStackView.addArrangedSubview(avatarsButton)
    }
    
    private func setUpConstraints() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let verticalConstraint = mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        let widthConstraint = mainStackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.7)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint])
    }
    
    // MARK: - Navigation
    @objc
    func navigateToEmojis() {
        let destination = EmojiListViewController()
        navigationController?.pushViewController(destination, animated: true)
    }
}
