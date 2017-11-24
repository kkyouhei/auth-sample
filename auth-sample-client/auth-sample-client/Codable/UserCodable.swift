//
//  UserCodable.swift
//  auth-sample-client
//
//  Created by 狩野 恭平 on 2017/11/24.
//  Copyright © 2017年 狩野 恭平. All rights reserved.
//

struct UserCodable: Decodable{
    struct User: Codable{
        let email: String
        let name: String
    }
    let token: String
    let user: User
}

extension UserCodable: Encodable{
    private enum UserKeys: String, CodingKey{
        case email
        case name
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: UserKeys.self)
        try container.encode(self.user.email, forKey: .email)
        try container.encode(self.user.name, forKey: .name)
    }
}
