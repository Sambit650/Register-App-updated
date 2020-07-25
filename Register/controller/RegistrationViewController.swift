//
//  RegistrationViewController.swift
//  Register
//
//  Created by Sambit Das on 01/04/20.
//  Copyright © 2020 Sambit Das. All rights reserved.
//

import UIKit
import RealmSwift

class RegistrationViewController: UIViewController {
    @IBOutlet weak var Regtitle: UILabel!
    @IBOutlet weak var firstNameTextfield: underLtextfield!
    @IBOutlet weak var lastNameTextfield: underLtextfield!
    @IBOutlet weak var emailTextfield: underLtextfield!
    @IBOutlet weak var passwordTextfield: underLtextfield!
    @IBOutlet weak var confPasswordTextfield: underLtextfield!
    @IBOutlet weak var numberTextfield: underLtextfield!
    @IBOutlet weak var radioMale: UIButton!
    @IBOutlet weak var radioFemale: UIButton!
    @IBOutlet weak var radioOther: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var RegistrationButton: UIButton!
    
    
    let data = DataModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        cancelButton.layer.cornerRadius = 10
        RegistrationButton.layer.cornerRadius = 10
       
    
    }
    
    @IBAction func registratioonButton(_ sender: Any) {
    
          
        let firstName = firstNameTextfield.text
        let lastName = lastNameTextfield.text
        let email = emailTextfield.text
        let password = passwordTextfield.text
        let confPassword = confPasswordTextfield.text
        let number = numberTextfield.text

        if( firstName!.isEmpty || lastName!.isEmpty || email!.isEmpty || password!.isEmpty || confPassword!.isEmpty || number!.isEmpty){
                
                print("Fill all the textfill")
               let alertController = UIAlertController(title: "All textfields are compulsory", message:
                   "Please fill all required fields ", preferredStyle: .alert)
               alertController.addAction(UIAlertAction(title: "try again", style: .default))
               
               self.present(alertController, animated: true, completion: nil)
                
            }else if(password != confPassword){
                
                    let alertController = UIAlertController(title: "Confirm password is not matched", message:
                        "Please Enter your correct password ", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "try again", style: .default))
                    
                    self.present(alertController, animated: true, completion: nil)
                   }
            
            else{

            let realm: Realm = {
                       return try! Realm()
                   }()
                   data.FName = firstName
                   data.LName = lastName
                   data.DEmail = email
                   data.Dpassword = password
                   data.Dnumber = number
                
                   try! realm.write {
                       realm.add(data)
                   }
            let alertController = UIAlertController(title: "Registered", message:
                                   "Your Data is Successfully Saved", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Done", style: .cancel){
                UIAlertAction in
                 self.performSegue(withIdentifier: "toHome", sender: self)
            }
                               
            alertController.addAction(cancelAction)
                               self.present(alertController, animated: true, completion: nil)
            
            }
        
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "toHome", sender: self)
    }
    
    
    @IBAction func maleBttn(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            radioFemale.isSelected = false
            radioOther.isSelected = false
        }else{
            sender.isSelected = true
            radioFemale.isSelected = false
            radioOther.isSelected = false
            data.Dgender = "male"
            
        }
    }
    @IBAction func femaleBttn(_ sender: UIButton) {
        if sender.isSelected{
                   sender.isSelected = false
                   radioMale.isSelected = false
                   radioOther.isSelected = false
            
               }else{
                   sender.isSelected = true
                   radioMale.isSelected = false
                   radioOther.isSelected = false
                  data.Dgender = "female"
               }
    }
    @IBAction func OtherBttn(_ sender: UIButton) {
        if sender.isSelected{
                   sender.isSelected = false
                   radioMale.isSelected = false
                   radioFemale.isSelected = false
               }else{
                 sender.isSelected = true
                 radioMale.isSelected = false
                 radioFemale.isSelected = false
                data.Dgender = "other"
            
               }
    }
    
 
}

class underLtextfield : UITextField{
    
    
    override func  awakeFromNib() {
        super.awakeFromNib()
        
        let btmBorder = CALayer()
        let borderWidth : CGFloat = 2
        btmBorder.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        btmBorder.borderWidth = borderWidth
        btmBorder.frame = CGRect(x: 0, y: self.frame.size.height - borderWidth, width: self.frame.size.width, height: 2)
        self.layer.addSublayer(btmBorder)
        self.borderStyle = .none
        self.backgroundColor = UIColor.clear
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        self.layer.masksToBounds = true
        
    }


}
