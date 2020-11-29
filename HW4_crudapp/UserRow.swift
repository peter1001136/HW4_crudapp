//
//  UserRow.swift
//  HW4_crudapp
//
//  Created by 陳政沂 on 2020/11/19.
//

import SwiftUI

struct UserRow: View {
    var users: User
    
    var body: some View {
        HStack{
            VStack {
                Text(users.name)
                    .font(.title)
                    .foregroundColor(.blue)
                    .fontWeight(.heavy)
                HStack {
                    VStack{
                        Text("最愛歌手:")
                            .fontWeight(.heavy)
                            //.padding(5)
                        Text("\(users.signer)")
                            .font(.system(size: 20))
                            .fontWeight(.heavy)
                            .padding(5)
                    }
                    //.padding()
                    
                    VStack{
                        Text("最愛歌曲:")
                            .fontWeight(.heavy)
                            //.padding(5)
                        Text("\(users.song)")
                            .font(.system(size: 20))
                            .fontWeight(.heavy)
                            .padding(5)
                    }
                    .padding()
                    
                    HStack{
                        Text("likes:")
                            .fontWeight(.heavy)
                        Text("\(users.likes)")
                             .font(.system(size: 20))
                             .fontWeight(.heavy)
                        Image(systemName: "heart.fill")
                         .foregroundColor(.red)
                    }
                }
            }
            Spacer()
        }
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        UserRow(users: User(name: "Peter", signer: "周杰倫", song: "說好不哭", likes: 10))
            .previewLayout(.sizeThatFits)
    }
}
