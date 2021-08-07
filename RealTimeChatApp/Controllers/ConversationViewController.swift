//
//  ConversationViewController.swift
//  RealTimeChatApp
//
//  Created by Miya Lee on 05/08/2021.
//

import UIKit

class ConversationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let isLoggedIn = UserDefaults.standard.bool(forKey: "logged_in")
        
        if !isLoggedIn {
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen // if not-> pop up as a card
            present(nav, animated: true)
        }
    }


}

