//
//  HistogramView.swift
//  HW4_crudapp
//
//  Created by 陳政沂 on 2020/11/23.
//

import SwiftUI

struct HistogramView: View {
    var countlikes = [Int]()
    var percent: [CGFloat] = [0, 0, 0, 0, 0, 0]
    var lable: [Int] = [0, 0, 0, 0 ,0, 0]
    var max: CGFloat = 0
    var total:CGFloat = 0
    
    let likesnum = ["0讚", "1讚", "2讚", "3讚", "4讚", "5讚"]
    
    init(countlikes: [Int]){
        for likes in countlikes{
            if CGFloat(likes) > max{
                max = CGFloat(likes)
            }
            total += CGFloat(likes)
        }
        
        for i in 0 ..< countlikes.count{
            lable[i] = countlikes[i]
            percent[i] = CGFloat(CGFloat(countlikes[i]) / total)
        }
    }
    var body: some View {
        VStack{
            Spacer()
            HStack(alignment: .bottom){
                VStack{
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 30, height: 500 * percent[0])
                    Text("\(lable[0])")
                    Text("\(likesnum[0])")
                }
                VStack{
                    Rectangle()
                        .fill(Color.orange)
                        .frame(width: 30, height: 500 * percent[1])
                    Text("\(lable[1])")
                    Text("\(likesnum[1])")
                }
                VStack{
                    Rectangle()
                        .fill(Color.yellow)
                        .frame(width: 30, height: 500 * percent[2])
                    Text("\(lable[2])")
                    Text("\(likesnum[2])")
                }
                VStack{
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: 30, height: 500 * percent[3])
                    Text("\(lable[3])")
                    Text("\(likesnum[3])")
                }
                VStack{
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 30, height: 500 * percent[4])
                    Text("\(lable[4])")
                    Text("\(likesnum[4])")
                }
                VStack{
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 30, height: (500 * percent[5]))
                    Text("\(lable[5])")
                    Text("\(likesnum[5])")
                }
            }
            Spacer()
        }
    }
}

struct HistogramView_Previews: PreviewProvider {
    static var previews: some View {
        HistogramView(countlikes: [1, 2, 3, 4, 5, 6])
    }
}
