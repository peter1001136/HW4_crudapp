//
//  rankView.swift
//  HW4_crudapp
//
//  Created by 陳政沂 on 2020/11/24.
//

import SwiftUI
import Foundation

struct rank: Identifiable {
    var id = UUID()
    var song: String
    var singer: String
    var likes: Int
    var music: String
}

struct rankView: View {
    @ObservedObject var usersData = UserData()
    
    var totalusers: Int = 0
    var songrank = [
        rank(song: "告白氣球", singer: "周杰倫", likes: 0, music:"zhou-jie-lun-jay-chou-te-bie-yan-chu-pai-wei-jun-gao-bai-qi-qiu-love-confession-official-mv"),
        rank(song: "等你下課", singer: "周杰倫", likes: 0, music:"zhou-jie-lun-jay-chou-with-yang-rui-dai-deng-ni-xia-ke-waiting-for-you-ge-ci-ban-mv"),
        rank(song: "不愛我就拉倒", singer: "周杰倫", likes: 0, music:"zhou-jie-lun-jay-chou-bu-ai-wo-jiu-la-dao-if-you-dont-love-me-its-fine-official-mv-fa-shao-ying-pian-hua-yu-di-qu-chan-lian-di-mei-guo-zhi-chong-qian-er"),
        rank(song: "說好不哭", singer: "周杰倫", likes: 0, music:"zhou-jie-lun-jay-chou-shuo-hao-bu-ku-wont-cry-with-wu-yue-tian-a-xin-mayday-ashin-official-mv"),
        rank(song: "不該", singer: "周杰倫", likes: 0, music:"zhou-jie-lun-jay-chou-x-amei-bu-gai-shouldnt-be-official-mv"),
        rank(song: "Change", singer: "瘦子Ｅ.so", likes: 0, music:"shou-zi-e-so-change-official-music-video-5k"),
        rank(song: "Wait", singer: "瘦子Ｅ.so", likes: 0, music:"shou-zi-e-so-wait-official-music-video"),
        rank(song: "她沒在看我", singer: "瘦子Ｅ.so", likes: 0, music:"shou-zi-e-so-ta-mei-zai-kan-wo-she-aint-watchin-official-music-video-5k"),
        rank(song: "伯父", singer: "瘦子Ｅ.so", likes: 0, music:"shou-zi-e-so-bo-fu-bo-fu-official-music-video"),
        rank(song: "太陽", singer: "瘦子Ｅ.so", likes: 0, music:"shou-zi-e-so-tai-yang-when-the-cloudless-day-comes-lyric-video"),
        rank(song: "怎麼了", singer: "瘦子Ｅ.so", likes: 0, music:"hua-ju-ni-you-nian-da-xue-ma-pian-wei-qu"),
        rank(song: "以後別做朋友", singer: "瘦子Ｅ.so", likes: 0, music:"ericzhou-xing-zhe-yi-hou-bie-zuo-peng-you-the-distance-of-love-official-music-video"),
        rank(song: "你好不好", singer: "瘦子Ｅ.so", likes: 0, music:"ericzhou-xing-zhe-ni-hao-bu-hao-how-have-you-been-official-music-video-yi-han-pin-tu-pian-wei-qu"),
        rank(song: "終於了解自由", singer: "瘦子Ｅ.so", likes: 0, music:"ericzhou-xing-zhe-zhong-yu-liao-jie-zi-you-freedom-official-music-video"),
        rank(song: "我很快樂", singer: "瘦子Ｅ.so", likes: 0, music:"ericzhou-xing-zhe-wo-hen-kuai-le-im-happy-official-music-video")
    ]
    
    
    init(usersData: UserData) {
        for data in usersData.users{
            totalusers+=1
            for i in 0 ..< songrank.count{
                if data.song == songrank[i].song{
                    songrank[i].likes += data.likes
                }
            }
        }
    }
    
    var body: some View {
        List{
            Section(header: Text("排名")) {
                ForEach(songrank.sorted{ $0.likes > $1.likes}){index in
                    HStack{
                        Image(index.song)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 5))
                        VStack(alignment: .leading){
                            Text(index.song)
                                .font(.system(size: 26))
                                .fontWeight(.bold)
                            Text(index.singer)
                                .font(.system(size: 20))
                        }
                        Spacer()
                        Text("\(index.likes)")
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                    }
                }
            }
        }
    }
}

struct rankView_Previews: PreviewProvider {
    static var previews: some View {
        rankView(usersData: UserData())
    }
}
