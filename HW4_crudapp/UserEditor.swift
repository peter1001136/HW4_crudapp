//
//  UserEditor.swift
//  HW4_crudapp
//
//  Created by 陳政沂 on 2020/11/19.
//

import SwiftUI

struct UserEditor: View {
    @Environment(\.presentationMode) var presentationMode
    
    var usersData: UserData
    var editUserindex: Int?
    
    let fav_singers = ["周杰倫", "瘦子Ｅ.so", "周興哲"]
    let fav_songs =  ["告白氣球", "等你下課", "不愛我就拉倒", "說好不哭", "不該", "Change", "Wait", "她沒在看我", "伯父", "太陽", "怎麼了", "以後別做朋友", "你好不好", "終於了解自由", "我很快樂"]
    
    @State private var name = ""
    @State private var fav_singer = ""
    @State private var fav_song = ""
    @State private var likes = 0
    
    var body: some View {
        Form{
            TextField("名字", text: $name)
            
            HStack{
                Text("喜愛歌手：")
                Picker("喜愛歌手", selection: $fav_singer) {
                    ForEach(fav_singers, id: \.self){ (fav_singer)in
                        Text(fav_singer)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            VStack(alignment: .leading) {
                Text("喜愛歌曲：")
                Picker("喜愛歌曲", selection: $fav_song){
                    ForEach(fav_songs, id: \.self){ (fav_song) in
                        Text(fav_song)
                    }
                }
                .pickerStyle(WheelPickerStyle())
            }
            
            Stepper("點讚: \(likes)", value: $likes, in: 0 ... 5)
        }
        .onAppear(perform: {
            if let editUserindex = editUserindex{
                let editUser = usersData.users[editUserindex]
                name = editUser.name
            }
        })
        .navigationBarTitle(editUserindex == nil ? "新增使用者" : "修改使用者", displayMode: .inline)
        .navigationBarItems(trailing: Button("Save"){
            let user = User(name: name, signer: fav_singer, song: fav_song, likes: likes)
            if let editUserindex = editUserindex{
                usersData.users[editUserindex] = user
            } else{
                usersData.users.insert(user, at: 0)
            }
            presentationMode.wrappedValue.dismiss()
        })
    }
}

struct UserEditor_Previews: PreviewProvider {
    static var previews: some View {
        UserEditor(usersData: UserData())
    }
}
