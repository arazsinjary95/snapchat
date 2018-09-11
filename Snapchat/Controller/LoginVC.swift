//
//  LoginVC.swift
//  Snapchat
//
//  Created by Araz Sinjary on 9/11/18.
//  Copyright © 2018 Araz Sinjary. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailField: RoundTextField!
    @IBOutlet weak var passwordField: RoundTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  
    @IBAction func loginBtnPressed(_ sender: Any) {
        
        if let email = emailField.text, let pass = passwordField.text , (email.characters.count > 0 && pass.characters.count > 0) {
            
            AuthService.instance.login(email: "", password: "")
            
        } else {
            let alert = UIAlertController(title: "Username and Password Required", message: "You must enter both a username and a password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
}
