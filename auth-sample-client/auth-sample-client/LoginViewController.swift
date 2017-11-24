//
//  ViewController.swift
//  auth-sample-client
//
//  Created by 狩野 恭平 on 2017/11/23.
//  Copyright © 2017年 狩野 恭平. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    let loginURL: String = "http://localhost:3000/api/user_sessions"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(_ sender: Any) {
        let param = ["email": self.emailField.text ?? "", "password": self.passwordField.text ?? ""]
        Alamofire.request(self.loginURL, method: .post, parameters: param, encoding: URLEncoding.default).responseJSON { response in
            if let data = response.data {
                let decoder: JSONDecoder = JSONDecoder()
                if let user = try? decoder.decode(UserCodable.self, from: data) {
                    User.create(codable: user)
                    let sb = UIStoryboard(name: "Profile", bundle: nil)
                    if let vc = sb.instantiateInitialViewController(){
                        vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                        self.present(vc, animated: true, completion: nil)
                    }
                }
            }
        }
    }
}
