//
//  ContentView.swift
//  HW4_crudapp
//
//  Created by 陳政沂 on 2020/11/19.
//

import SwiftUI

struct ContentView: View {
    @StateObject var usersData = UserData()
    
    var body: some View {
        TabView{
            UserList(usersData: self.usersData)
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("使用者")
                }
            
            rankView(usersData: self.usersData)
                .tabItem {
                    Image(systemName: "list.number")
                    Text("排名")
                }
            
            chartView(usersData: self.usersData)
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("分析")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
