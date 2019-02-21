//
//  MyConstant.swift
//  LoginApp
//
//  Created by Pudit Rungsettee on 21/2/2562 BE.
//  Copyright © 2562 Pudit Rungsettee. All rights reserved.
//

import Foundation

class MyConstant {

    func getURLaddUser(name : String, user : String, password : String ) -> String {
        let result : String = "https://www.androidthai.in.th/turbo/addUserTurbo.php?isAdd=true&Name=\(name)&Username=\(user)&Password=\(password)"
        return result
        
    }
    
    func getURLgetUserWhereUser(user : String) -> String {
        return "https://www.androidthai.in.th/turbo/getUserWhereUserTurbo.php?isAdd=true&Username=\(user)"
    }
    
    

}
