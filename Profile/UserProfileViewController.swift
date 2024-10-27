//
//  UserProfileViewController.swift
//  Navigation
//
//  Created by Brooklyn on 27/10/2024.
//

import Foundation
import UIKit

class UserProfileViewController: UIViewController {
    
    private let profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        view.addSubview(profileHeaderView)
        
        profileHeaderView.configure(profileImage: UIImage(named: "catImage") ?? UIImage(),
                                    name: "Hipster Cat",
                                    status: "Waiting for something...")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        profileHeaderView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 300)
    }
}
