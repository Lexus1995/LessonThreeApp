//
//  UserProfileViewController.swift
//  LessonThreeApp
//
//  Created by  Aliaksei on 13.03.2022.
//

import UIKit

class UserProfileViewController: UIViewController {

    @IBOutlet var introLabel: UILabel!
    
    var introUser = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        introLabel.text = introUser
    }
}
