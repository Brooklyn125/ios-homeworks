//
//  UserProfileViewController.swift
//  Navigation
//
//  Created by Brooklyn on 27/10/2024.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    private let profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        let titleLabel = UILabel()
        titleLabel.text = "Profile"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textColor = .black
        navigationItem.titleView = titleLabel
        
        view.addSubview(profileHeaderView)
        
        profileHeaderView.configure(profileImage: UIImage(named: "catImage") ?? UIImage(),
                                    name: "Hipster Cat",
                                    status: "Waiting for something...")
        addProfileHeaderView()
       }

       private func addProfileHeaderView() {
           view.addSubview(profileHeaderView)
           
           profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
               profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
               profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
               profileHeaderView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
           ])
       }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        profileHeaderView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 300)
    }
}
