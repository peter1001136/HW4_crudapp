//
//  chartView.swift
//  HW4_crudapp
//
//  Created by 陳政沂 on 2020/11/22.
//

import SwiftUI

struct chartView: View {
    @ObservedObject var usersData = UserData()
    @State private var selectchart: String = "圓餅圖"
    @State private var trimEnd: CGFloat = 0
    
    var totalusers: Double = 0
    //var index: Double = 0
    var countsinger: [Double] = [0, 0, 0]
    var percentsinger: [Double] = [0, 0, 0]
    var angles = [Angle]()
    var startDegree: Double = 0
    var countlikes: [Int] = [0, 0, 0, 0, 0, 0]
    var totallikes: Int = 0
    var rate: [Double] = [0, 0, 0, 0, 0, 0]
    var max: Double = 0
    var mostLikes: String = ""
    
    let fav_singers = ["周杰倫", "瘦子Ｅ.so", "周興哲"]
    let fav_songs =  ["告白氣球", "等你下課", "不愛我就拉倒", "說好不哭", "不該", "Change", "Wait", "她沒在看我", "伯父", "太陽", "怎麼了", "以後別做朋友", "你好不好", "終於了解自由", "我很快樂"]
    let like = [0, 1, 2, 3, 4, 5]
    let chart = ["圓餅圖", "柱狀圖", "圓環圖"]
    
    init(usersData: UserData){
        for data in usersData.users{
            //index += 1
            totalusers += 1
            totallikes += data.likes
            
            
            
            for i in 0 ..< fav_singers.count{
                if data.signer == fav_singers[i]{
                    countsinger[i] += 1
                }
            }
            for i in 0 ..< like.count{
                if data.likes == like[i] {
                    countlikes[i] += 1
                }
            }
        }
        for i in 0 ..< fav_singers.count{
            percentsinger[i] = countsinger[i] / totalusers
            print(percentsinger[i])
        }
        for percent in percentsinger{
            angles.append(.degrees(startDegree))
            startDegree += 360 * percent
        }
        for i in 0 ..< 6{
            rate[i] = Double(countlikes[i]) / Double(totalusers)
            if rate[i] > max{
                max = rate[i]
                mostLikes = String(like[i])
            }
        }
    }
    
    var body: some View {
        NavigationView{
            VStack{
                Picker(selection: self.$selectchart, label: Text("選擇圖表")){
                    ForEach (self.chart, id: \.self){ (text) in
                        Text(text)
                    }
                }
                .labelsHidden()
                .pickerStyle(SegmentedPickerStyle())
                .padding(20)
                
                if self.selectchart == "圓餅圖"{
                    VStack {
                        HStack{
                            VStack(alignment: .leading){
                                Color.red.frame(width: 10, height: 10)
                                Text("周杰倫")
                                Text(String(format: "%.1f", percentsinger[0] * 100) + "%")
                            }
                            .padding()

                            VStack(alignment: .leading){
                                Color.green.frame(width: 10, height: 10)
                                Text("瘦子Ｅ.so")
                                Text(String(format: "%.1f", percentsinger[1] * 100) + "%")
                            }
                            .padding()

                            VStack(alignment: .leading){
                                Color.blue.frame(width: 10, height: 10)
                                Text("周興哲")
                                Text(String(format: "%.1f", percentsinger[2] * 100) + "%")
                            }
                            .padding()
                        }
                        piechartView(startAngle: angles)
                            .frame(width: 200, height: 200)
                    }
                }
                else if self.selectchart == "柱狀圖"{
                    HistogramView(countlikes: countlikes)
                }
                else{
                    VStack{
                        Text("\(mostLikes)"+"讚最多")
                            .font(.system(size: 25))
                        Text("占比：")
                            .font(.system(size: 25))
                        ZStack {
                            Text("\(max)")
                                .font(.system(size: 33))
                            Circle()
                                .trim(from: 0, to: trimEnd)
                                .stroke(Color.blue, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                                .frame(width: 250, height: 250)
                                .animation(.linear(duration: 0.8))
                                .onAppear {
                                    self.trimEnd = CGFloat(self.max)
                            }
                        }
                    }
                }
                Spacer()
            }
            .navigationTitle("圖表分析")
        }
        
    }
}

struct chartView_Previews: PreviewProvider {
    static var previews: some View {
        chartView(usersData: UserData())
    }
}
