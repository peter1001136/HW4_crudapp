//
//  UserData.swift
//  HW4_crudapp
//
//  Created by 陳政沂 on 2020/11/19.
//

import SwiftUI
import Foundation
import Combine

class UserData: ObservableObject {
    @AppStorage("users") var usersData: Data?
    @Published var users = [User]()
    var cancellable: AnyCancellable?
        
    init() {
        if let usersData = UserDefaults.standard.data(forKey: "users"){
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([User].self, from: usersData){
                users = decodedData
            }
        }
        
        cancellable = $users
           .sink{ (value) in
               let encoder = JSONEncoder()
               do {
                  let data = try encoder.encode(value)
                   UserDefaults.standard.set(data, forKey: "users")
              }catch{

              }
           }
    }
}

struct UserData_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
