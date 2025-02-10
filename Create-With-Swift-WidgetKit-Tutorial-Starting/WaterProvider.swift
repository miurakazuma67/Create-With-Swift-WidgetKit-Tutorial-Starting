//
//  Untitled.swift
//  Create-With-Swift-WidgetKit-Tutorial-Starting
//
//  Created by 三浦一真 on 2025/02/10.
//

// 1.
import WidgetKit

struct WaterProvider: TimelineProvider {
    
    private let waterTips = Tips()
    
    private let placeholderEntry = WaterEntry(
        date: Date(),
        waterTip: ""
    )
    
    // 1.特定のコンテンツを持たないウィジェットの一般的な視覚表現を表示するために使用されます。ウィジェットが起動時に読み込まれるときに呼び出すことができます。
    func placeholder(in context: Context) -> WaterEntry {
        return placeholderEntry
    }
    
    // 2.WidgetKitタイムラインプロバイダーに 一般的なデータを表示するプレビュースナップショットを要求
    func getSnapshot(in context: Context, completion: @escaping (WaterEntry) -> ()) {
        completion(placeholderEntry)
    }
    
    // 3.プロバイダーにタイムラインを要求する
    func getTimeline(in context: Context, completion: @escaping (Timeline<WaterEntry>) -> Void) {
        let currentDate = Date()
        var entries : [WaterEntry] = []
        
        for minuteOffset in 0 ..< 60 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: minuteOffset, to: currentDate)!
            let tip = waterTips.tipsList[Int.random(in: 0...waterTips.tipsList.count-1)]
            let entry = WaterEntry(date: entryDate, waterTip: tip)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        
        completion(timeline)
    }
}
