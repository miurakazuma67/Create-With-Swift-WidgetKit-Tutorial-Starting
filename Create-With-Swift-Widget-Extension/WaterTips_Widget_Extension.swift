//
//  Untitled.swift
//  Create-With-Swift-WidgetKit-Tutorial-Starting
//
//  Created by 三浦一真 on 2025/02/10.
//

// 1.
import WidgetKit
import SwiftUI

// 2.タグでマークされた新しい構造体を作成し、@mainこの構造体をウィジェットターゲットのエントリポイントとして示す
@main
struct WaterTips_Widget_Extension: Widget {
    // 3.ウィジェットの識別子として機能する
    let kind: String = "Create-With-Swift-Example_Widget"
    var body: some WidgetConfiguration {
        
        // 4.必要なウィジェットのコンテンツを記述するオブジェクト
        StaticConfiguration(
            kind: kind, // ウィジェットを識別するための一意の文字列
            provider: WaterProvider(), // ウィジェットのビューの更新のタイミングを決定するオブジェクト
            content: { WaterWidgetView(entry: $0) } // ウィジェットをレンダリングするビュー
        )
        // 5.ユーザーがウィジェット ギャラリーでウィジェットを追加または編集するときにウィジェットに表示されるローカライズされた名前を設定
        .configurationDisplayName("Water tips")
        // 6.ウィジェットギャラリーに表示されるローカライズされた説明を設定
        .description("Some little tips about water that will change your life!")
        // 7.wigetでサポートされているサイズ
        .supportedFamilies([
            .systemMedium,
            .systemLarge
        ])
    }
}

//// 1.
//#Preview(as: .systemMedium) {
//    WaterTips_Widget_Extension()
//} timeline: {
//    WaterEntry(date: .now, waterTip: "Drink water!")
//    WaterEntry(date: .now + 1, waterTip: "Did you drink water?")
//}
//
//#Preview(as: .systemLarge) {
//    WaterTips_Widget_Extension()
//} timeline: {
//    WaterEntry(date: .now, waterTip: "Drink water!")
//    WaterEntry(date: .now + 1, waterTip: "Did you drink water?")
//}
