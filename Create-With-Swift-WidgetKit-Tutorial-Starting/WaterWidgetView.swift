//
//  Untitled.swift
//  Create-With-Swift-WidgetKit-Tutorial-Starting
//
//  Created by 三浦一真 on 2025/02/10.
//

// 1.
import WidgetKit
import SwiftUI

struct WaterWidgetView: View {
    
    // 2.タイムラインによって提供される現在のエントリを表示するために使用される変数
    var entry: WaterProvider.Entry
    
    // 3.プロパティによって表されるタイムライン エントリを表示するシンプルなビューを作成
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image(systemName: "drop")
                Text("Tip of the day")
            }
            .font(.title3)
            .bold()
            .padding(.bottom, 8)
            
            Text(entry.waterTip)
                .font(.caption)
            
            Spacer()
            
            HStack{
                Spacer()
                Text("**Last Update:** \\(entry.date.formatted(.dateTime))")
                    .font(.caption2)
                
            }
        }
        .foregroundStyle(.white)
        
        // 4.ウィジェットの背景ビューの定義が可能になり、システムがさまざまなコンテキストに適応しやすくなります。
        .containerBackground(for: .widget){
            Color.cyan
        }
    }
}
