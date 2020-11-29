//
//  piechartView.swift
//  HW4_crudapp
//
//  Created by 陳政沂 on 2020/11/23.
//

import SwiftUI

struct piechartView: View {
    var startAngle: [Angle]
    let fav_singers = ["周杰倫", "瘦子Ｅ.so", "周興哲"]
    
    var body: some View {
        ZStack{
            PieChart(startAngle: self.startAngle[0], endAngle: self.startAngle[1])
                .fill(Color.red)
            PieChart(startAngle: self.startAngle[1], endAngle: self.startAngle[2])
                .fill(Color.green)
            PieChart(startAngle: self.startAngle[2], endAngle: .degrees(360))
                .fill(Color.blue)
        }
    }
}

struct piechartView_Previews: PreviewProvider {
    static var previews: some View {
        piechartView(startAngle: [.degrees(0), .degrees(100)])
    }
}

struct PieChart: Shape {
    var startAngle: Angle
    var endAngle: Angle
    
    func path(in rect: CGRect) -> Path {
        Path{ (path) in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            path.move(to: center)
            path.addArc(center: center, radius: rect.midX, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}
