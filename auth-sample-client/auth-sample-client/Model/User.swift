//
//  User.swift
//  auth-sample-client
//
//  Created by 狩野 恭平 on 2017/11/24.
//  Copyright © 2017年 狩野 恭平. All rights reserved.
//

import RealmSwift
import Foundation

class User: Object{
    @objc dynamic var name: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var token: String = ""
}
