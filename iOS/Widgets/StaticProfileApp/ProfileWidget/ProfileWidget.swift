//
//  ProfileWidget.swift
//  ProfileWidget
//
//  Created by 서보경 on 2021/09/08.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct ProfileWidgetEntryView : View {
    @Environment(\.widgetFamily) private var widgetFamily
    var entry: Provider.Entry

    var body: some View {
        switch widgetFamily {
        case .systemMedium:
            MediumProfileWidget()
        default:
            Text("Hello")
        }
        
        
    }
}

// Medium Size Widget

struct MediumProfileWidget: View {
    var body: some View {
        ZStack {
            Color(.systemOrange)
            HStack {
                Image(systemName: "heart.fill")
                    .resizable()
                    .frame(width: 80, height: 80, alignment: .center)
                VStack(alignment: .leading) {
                    Spacer()
                    Text("Be-beee")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("iOS Developer")
                        .font(.caption)
                        .fontWeight(.thin)
                    Spacer()
                    Text("maybutter756@gmail.com")
                        .font(.footnote)
                    Spacer()
                    
                }
            }
        }
    }
}

@main
struct ProfileWidget: Widget {
    let kind: String = "ProfileWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            ProfileWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct ProfileWidget_Previews: PreviewProvider {
    static var previews: some View {
        ProfileWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
