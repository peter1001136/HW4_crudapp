//
//  User.swift
//  HW4_crudapp
//
//  Created by 陳政沂 on 2020/11/19.
//

import Foundation

struct User: Identifiable, Codable {
    var id = UUID()
    var name: String
    var signer: String
    var song: String
    var likes: Int
}
