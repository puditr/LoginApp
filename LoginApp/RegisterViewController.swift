//
//  RegisterViewController.swift
//  LoginApp
//
//  Created by Pudit Rungsettee on 21/2/2562 BE.
//  Copyright © 2562 Pudit Rungsettee. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var userTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    } // Main Method
    

    @IBAction func uploadButton(_ sender: UIBarButtonItem) {
        let name : String = nameTextField.text!
        let user : String = userTextField.text!
        let password : String = passwordTextField.text!
        
        print("name ==> \(name) user ==> \(user) password ==>\(password)")
        
        if (name.count == 0) || (user.count == 0) || (password.count == 0) {
            // Have Space
            registerAlert(title: "Have Space", message: "Please Fill All Blanks")
        } else {
            // No Space
            uploadToServer(name: name, user: user, password: password)
        } // If else
        
        
        
        
        
        
    } // Upload Button
    
    func registerAlert(title : String , message : String) -> Void {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            
        }))
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func uploadToServer(name : String, user : String, password : String) -> Void {
        let myConstant = MyConstant()
        let urlPHP : String = myConstant.getURLaddUser(name: name, user: user, password: password)
        let url = URL(string: urlPHP)
        let request = NSMutableURLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request as URLRequest){data, reponse, error in
            
            if error != nil {
                print("Have Error")
            } else {
                
                
 // Check data Can Readable
                if let testData = data {
                    let canReadableData = NSString(data: testData, encoding: String.Encoding.utf8.rawValue)
                    print("canReadableData==>\(String(describing: canReadableData))")
                    
                    if canReadableData! == "true" {
                        print("Response True")
                        DispatchQueue.main.async {
                            self.performSegue(withIdentifier: "BackHome", sender: self)
                        }
                        
                    } else {}
                    
                } //if2
                
            } // If
            
        } //End of Task
        
        task.resume()
        
        
        
        
    }
    
} // Main Class
