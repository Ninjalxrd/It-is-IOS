//
//  SecondViewController.swift
//  FirstApp
//
//  Created by Павел on 03.07.2024.
//

import UIKit

class SecondViewController: UIViewController {
    var user: User?
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var BirthLabel: UILabel!
    @IBOutlet weak var AboutLabel: UILabel!
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var AvatarImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        BackButton.layer.cornerRadius = 20
        guard let user = user else {
            print("User data not available")
            return
        }
        
        AvatarImageView.image = user.image
        NameLabel.text = user.name
        BirthLabel.text = user.birth
        AboutLabel.text = user.about
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
