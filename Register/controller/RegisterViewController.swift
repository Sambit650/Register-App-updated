//
//  RegisterViewController.swift
//  Register
//
//  Created by Sambit Das on 02/04/20.
//  Copyright © 2020 Sambit Das. All rights reserved.
//

import UIKit
import RealmSwift

class RegisterViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    var recvDta : Results<DataModel>!
    @IBOutlet weak var tebleView: UITableView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var registrationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let realm = try! Realm()
        recvDta = realm.objects(DataModel.self)
        cancelButton.layer.cornerRadius = 10
        registrationButton.layer.cornerRadius = 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recvDta?.count ?? 0
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        let userData = recvDta[indexPath.row]
        cell.fName.text = userData.FName
        cell.lName.text = userData.LName
        cell.pEmail.text = userData.DEmail
        cell.pNumber.text = userData.Dnumber
        cell.gender.text = "male"
        
        cell.layer.borderWidth = 1
        cell.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cell.layer.cornerRadius = 10
        return cell
       }
    @IBAction func canclBttn(_ sender: Any) {
        self.performSegue(withIdentifier: "tblToHome", sender: self)
    }
    @IBAction func regBttn(_ sender: Any) {
        self.performSegue(withIdentifier: "tblToHome", sender: self)
    }
    
}

class underLineLbl : UILabel{
    override func  awakeFromNib() {
        super.awakeFromNib()
        
        let btmBorder = CALayer()
        let borderWidth : CGFloat = 2
        btmBorder.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        btmBorder.borderWidth = borderWidth
        btmBorder.frame = CGRect(x: 0, y: self.frame.size.height - borderWidth, width: self.frame.size.width, height: borderWidth)
        self.layer.addSublayer(btmBorder)
       // self.borderStyle = .none
        self.backgroundColor = UIColor.clear
        self.layer.masksToBounds = true
        
    }

    
}
