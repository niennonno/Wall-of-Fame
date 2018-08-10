//
//  ViewController.swift
//  Wall of Fame
//
//  Created by Aditya Vikram Godawat on 03/08/18.
//  Copyright © 2018 Aditya Vikram Godawat. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore

class ViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.layer.cornerRadius = loginButton.frame.height / 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func facebookButtonTapped(_ sender: Any) {
    
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [ReadPermission.publicProfile], viewController: self) { (loginResult) in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success:
                let wallViewController = self.storyboard?.instantiateViewController(withIdentifier: "WallViewController") as! UIViewController
                self.navigationController?.pushViewController(wallViewController, animated: true)

                print("Logged in!")
            }

        }
    }
}
