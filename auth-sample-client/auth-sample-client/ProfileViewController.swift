//
//  ProfileViewController.swift
//  auth-sample-client
//
//  Created by 狩野 恭平 on 2017/11/24.
//  Copyright © 2017年 狩野 恭平. All rights reserved.
//

import UIKit
import RealmSwift

class ProfileViewController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try! Realm()
        if let user = realm.objects(User.self).first {
            self.emailLabel.text = user.email
            self.nameLabel.text = user.name
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logout(_ sender: Any) {
        let realm: Realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
        let sb: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
        if let vc = sb.instantiateInitialViewController() {
            vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(vc, animated: true, completion: nil)
        }
    }
}
