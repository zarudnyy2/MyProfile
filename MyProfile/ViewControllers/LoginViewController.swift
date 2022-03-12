//
//  ViewController.swift
//  MyProfile
//
//  Created by Алексей Зарудный on 11.03.2022.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let user = "qwe"
    private let password = "qwe"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomVC = segue.destination as? WelcomeViewController else { return }
        welcomVC.user = user
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func loginButtonPress() {
        guard userNameTextField.text == user, passwordTextField.text == password else {
            showAlert(title: "Error", message: "Enter correct username or password", textField: passwordTextField)
            return
        }
        performSegue(withIdentifier: "openWelcomeVC", sender: nil)
    }
    @IBAction func showAuthorizationData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "👻", message: user)
        : showAlert(title: "😈", message: password)
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            loginButtonPress()
        }
        return true
    }
}
