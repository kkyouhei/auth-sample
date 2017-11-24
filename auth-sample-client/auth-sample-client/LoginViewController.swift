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
    lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        indicator.center = self.view.center
        indicator.hidesWhenStopped = true
        indicator.activityIndicatorViewStyle = .gray
        return indicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.indicator)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(_ sender: Any) {
        let param = ["email": self.emailField.text ?? "", "password": self.passwordField.text ?? ""]
        self.indicator.startAnimating()
        Alamofire.request(self.loginURL, method: .post, parameters: param, encoding: URLEncoding.default).responseJSON { [weak self] response in
            if let data = response.data {
                let decoder: JSONDecoder = JSONDecoder()
                if let user = try? decoder.decode(UserCodable.self, from: data) {
                    User.create(codable: user)
                    let sb = UIStoryboard(name: "Profile", bundle: nil)
                    if let vc = sb.instantiateInitialViewController(){
                        self?.indicator.stopAnimating()
                        vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                        self?.present(vc, animated: true, completion: nil)
                    }
                }
            }
        }
    }
}
