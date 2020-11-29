//
//  UserList.swift
//  HW4_crudapp
//
//  Created by 陳政沂 on 2020/11/19.
//

import SwiftUI

struct UserList: View {
    @StateObject var usersData = UserData()
    @State private var showuserEditor = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(usersData.users.indices, id: \.self){(index) in
                    NavigationLink(
                        destination: UserEditor(usersData: usersData, editUserindex: index)) {
                        UserRow(users: usersData.users[index])
                    }
                }
                .onDelete{ (indexSet) in
                    usersData.users.remove(atOffsets: indexSet)
               }
                .onMove{(indexSet, index) in
                    usersData.users.move(fromOffsets: indexSet, toOffset: index)
                }
            }
            .navigationBarTitle("使用者列表")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        showuserEditor = true
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                    })
                }
                ToolbarItem(placement: .navigationBarLeading){
                    EditButton()
                }
            })
            .sheet(isPresented: $showuserEditor){
                NavigationView {
                    UserEditor(usersData: usersData)
                }
            }
        }
    }
}

struct UserList_Previews: PreviewProvider {
    static var previews: some View {
        UserList()
    }
}
