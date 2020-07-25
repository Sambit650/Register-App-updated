//
//  DataModel.swift
//  Register
//
//  Created by Sambit Das on 01/04/20.
//  Copyright © 2020 Sambit Das. All rights reserved.
//

import Foundation
import RealmSwift


class DataModel : Object, Codable {
    
    @objc dynamic var FName : String?
    @objc dynamic var LName : String?
    @objc dynamic var DEmail : String?
    @objc dynamic var Dpassword : String?
    @objc dynamic var Dnumber : String?
    @objc dynamic var Dgender : String?
}


