//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Brooklyn on 27/10/2024.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private let avatarImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.layer.cornerRadius = 50
            imageView.layer.borderWidth = 3
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.clipsToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
    }()
    
    private let fullNameLabel: UILabel = {
           let label = UILabel()
           label.font = UIFont.boldSystemFont(ofSize: 18)
           label.textColor = .black
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
    }()
    
    private let statusLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14)
            label.textColor = .gray
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
    }()
    
    private let statusTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Enter new status"
            textField.font = UIFont.systemFont(ofSize: 14)
            textField.borderStyle = .roundedRect
            textField.translatesAutoresizingMaskIntoConstraints = false
            return textField
    }()
    
    private lazy var setStatusButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Set Status", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .systemBlue
            button.layer.cornerRadius = 4
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOffset = CGSize(width: 2, height: 2)
            button.layer.shadowRadius = 2
            button.layer.shadowOpacity = 0.5
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(setStatusButtonPressed), for: .touchUpInside)
            return button
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupView()
    }

    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func setupView() {
            backgroundColor = .lightGray
            addSubviews()
            setupConstraints()
        }

        private func addSubviews() {
            addSubview(avatarImageView)
            addSubview(fullNameLabel)
            addSubview(statusLabel)
            addSubview(statusTextField)
            addSubview(setStatusButton)
        }

        private func setupConstraints() {
            NSLayoutConstraint.activate([
                
                avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                avatarImageView.widthAnchor.constraint(equalToConstant: 100),
                avatarImageView.heightAnchor.constraint(equalToConstant: 100),

                fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
                fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
                fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

                statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 4),
                statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
                statusLabel.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor),

                statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 8),
                statusTextField.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
                statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                statusTextField.heightAnchor.constraint(equalToConstant: 34),

    
                setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
                setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                setStatusButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        }

        @objc private func setStatusButtonPressed() {
            guard let text = statusTextField.text, !text.isEmpty else { return }
            statusLabel.text = text
            statusTextField.text = ""
        }

        func configure(profileImage: UIImage, fullName: String, status: String) {
            avatarImageView.image = profileImage
            fullNameLabel.text = fullName
            statusLabel.text = status
        }
    }
