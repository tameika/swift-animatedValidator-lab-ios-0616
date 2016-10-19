//
//  ValidatorViewController.swift
//  animated-validator-swift
//
//  Created by Flatiron School on 6/27/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ValidatorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailConfirmationTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    
    
    var emailAddress = String()
    var password = String()
    var phoneNumber = [Int]()
    var counter = 0
    
    let color8 = UIColor(red: 0.50,
                        green: 0.50,
                        blue: 0.80,
                        alpha: 0.50)

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        self.submitButton.accessibilityLabel = Constants.SUBMITBUTTON
        self.emailTextField.accessibilityLabel = Constants.EMAILTEXTFIELD
        self.emailConfirmationTextField.accessibilityLabel = Constants.EMAILCONFIRMTEXTFIELD
        self.phoneTextField.accessibilityLabel = Constants.PHONETEXTFIELD
        self.passwordTextField.accessibilityLabel = Constants.PASSWORDTEXTFIELD
        self.passwordConfirmTextField.accessibilityLabel = Constants.PASSWORDCONFIRMTEXTFIELD
        
        self.submitButton.isEnabled = false
        submitButton.center.y  -= view.bounds.width
        view.backgroundColor = color8
        
    }
   
    func wrongTextFieldEntry(for field: UITextField) {

        UIView.animate(withDuration: 0.1, delay: 0.0, options: [.curveEaseIn], animations: {
            field.backgroundColor = UIColor.red
            })
        UIView.setAnimationRepeatCount(3.0)
        
    }
    
    
    func whiteOutBackground(for field: UITextField) {
        field.backgroundColor = UIColor.white
    }
    
    

    @IBAction func emailFieldAction(_ sender: AnyObject) {
        //if this does not happen then flash red
        
        if ((emailTextField.text)?.characters.contains("@"))! && ((emailTextField.text)?.characters.contains("."))! {
            whiteOutBackground(for: emailTextField)
            counter += 1
            print("email entered")
        } else {
            
        wrongTextFieldEntry(for: emailTextField)
            print("invalid email")
        }
        enableButton()
        print(counter)
    }



    @IBAction func emailConfirmationFieldAction(_ sender: AnyObject) {
        if emailConfirmationTextField.text == emailTextField.text {
            whiteOutBackground(for: emailConfirmationTextField)
            counter += 1
            print("email matches")
        } else {
            
            wrongTextFieldEntry(for: emailConfirmationTextField)
            print("email doesn't match")
        }
        enableButton()
        print(counter)
    }
    

    @IBAction func phoneFieldAction(_ sender: AnyObject) {
        if phoneTextField.text?.characters.count == 7 {
            whiteOutBackground(for: phoneTextField)
            counter += 1
            print("phone number entered")
        } else {
            
            wrongTextFieldEntry(for: phoneTextField)
            print("invalid phone number")
        }
        enableButton()
        print(counter)
    }
    
    
    @IBAction func passwordFieldAction(_ sender: AnyObject) {
        if (passwordTextField.text)!.characters.count == 6 {             whiteOutBackground(for: passwordTextField)
            counter += 1
            print("password entered")
        } else {
            
            wrongTextFieldEntry(for: passwordTextField)
            print("invalid password")
        }
        enableButton()
        print(counter)
    }
    
    
    @IBAction func passwordConfirmationFieldAction(_ sender: AnyObject) {
        if passwordTextField.text == passwordConfirmTextField.text {
            whiteOutBackground(for: passwordConfirmTextField)
            counter += 1
            print("password matches")
        } else {
            
            wrongTextFieldEntry(for: passwordConfirmTextField)
            print("password doesn't match")
        }
        enableButton()
        print(counter)
    }
    
    
    
    
    func enableButton() {
        if counter == 5 {
            self.submitButton.isEnabled = true
           UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseInOut, animations: {
                self.submitButton.center.y += self.view.bounds.width
            self.submitButton.isEnabled = true
            })
        }
        
    }

    
    
    
}


//self.submitButton.center.y = self.view.frame.minY

//self.view.layoutIfNeeded()  - what's that?, forces initial constrainsts to be applied, second one


//func shiftSubmitButton() {
    //self.view.layoutIfNeeded()
    //UIView.animate(withDuration: 2.0) {
        //self.topConstraint.constant -= 60
        //self.view.layoutIfNeeded()
    //}
//}




