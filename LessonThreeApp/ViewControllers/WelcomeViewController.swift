//
//  WelcomeViewController.swift
//  LessonThreeApp
//
//  Created by  Aliaksei on 09.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    
    @IBOutlet var welcomeUser: UILabel!
    
    var welcomeUserValue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeUser.text = "Welcome, \(welcomeUserValue))!"
    }
    
    @IBAction func logOutButton() {
    }
    
}
