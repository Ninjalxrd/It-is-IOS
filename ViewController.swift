//
//  ViewController.swift
//  FirstApp
//
//  Created by Павел on 03.07.2024.
//

import UIKit
struct User {
    let image: UIImage
    let name: String
    let birth: String
    let about: String
}

class ViewController: UIViewController {
    var currentUser: User?
    let login1: String = "aboba"
    let password1: String = "1111"
    
    let login2: String = "krutoi873"
    let password2: String = "1111"
    
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextField.layer.cornerRadius = 20
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle:.alert)
        alertController.addAction(UIAlertAction(title: "OK", style:.default))
        present(alertController, animated: true)
    }
    @IBAction func doneButton(_ sender: Any) {
        guard let text1 = loginTextField.text, let text2 = passwordTextField.text else {
            showAlert(title: "Oups...", message: "Please fill in all fields")
            return
        }

        if (text1 == login1 && text2 == password1) || (text1 == login2 && text2 == password2) {
            currentUser = initUser()
            navigationController?.popViewController(animated: true)
        } else {
            showAlert(title: "Oups...", message: "Wrong data")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SecondViewSegue" {
            if let destinationVC = segue.destination as? SecondViewController {
                destinationVC.user = currentUser
            }
        }
    }
    
    func initUser() -> User {
        var user: User
        if loginTextField.text == login1 {
            user = User(image: UIImage(named: "profileImage1")!, name: "Ilon Mask", birth: "10.03.1973", about: "love fantasy, cars and space")
        } else if loginTextField.text == login2 {
            user = User(image: UIImage(named: "profileImage2")!, name: "Pavel Sushkov", birth: "12.07.2005", about: "postav`te 100 ballov i chai")
        } else { user = User(image: UIImage(named: "defaultImage")!, name: "", birth: "", about: "" )}
        return user
    }
    
    
}

