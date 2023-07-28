//
//  ViewController.swift
//  passcode
//
//  Created by 郭家宇 on 2023/7/28.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var passcode1: UIImageView!
    @IBOutlet weak var passcode2: UIImageView!
    @IBOutlet weak var passcode3: UIImageView!
    @IBOutlet weak var passcode4: UIImageView!
    let passcode :String = "0621"
    var passcodeInput:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        passcodeInput = ""
    }
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        if let number  = sender.titleLabel?.text{
            passcodeInput += number
            updateImage()
            print("\(passcodeInput)")
            print("\(passcodeInput.count)")
            if passcodeInput.count == 4 {
                checkpassword()
                clearPassword()
            }
        }
    }
    func updateImage(){
        let enterCount = passcodeInput.count
        if enterCount >= 1 {
            passcode1.isHighlighted = true
            if enterCount >= 2 {
                passcode2.isHighlighted = true
                if enterCount >= 3 {
                    passcode3.isHighlighted = true
                    if enterCount >= 4 {
                        passcode4.isHighlighted = true
                    }else{
                        passcode4.isHighlighted = false
                    }
                }else{
                    passcode3.isHighlighted = false
                }
            }else{
                passcode2.isHighlighted = false
            }
        }else{
            passcode1.isHighlighted = false
        }
    }
    func checkpassword(){
        if passcodeInput == passcode {
            showAlert(title: "Success", message:"Password is correct,Welcome" )
        }else{
            showAlert(title: "Error", message: "Incorrect Password,Please try again.")
            clearPassword()
        }
    }
    func showAlert(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
    }
    func clearPassword(){
        passcodeInput = ""
        passcode1.isHighlighted = false
        passcode2.isHighlighted = false
        passcode3.isHighlighted = false
        passcode4.isHighlighted = false
    }

    @IBAction func backPassword(_ sender: UIButton) {
        if passcodeInput.count != 0{
            passcodeInput = String(passcodeInput.dropLast(1))
            updateImage()
        }

    }
}

