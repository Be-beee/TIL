//
//  ProfileWidget.swift
//  ProfileWidget
//
//  Created by 서보경 on 2021/09/08.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> ProfileEntry {
        ProfileEntry(date: Date(), profile: Profile())
    }

    func getSnapshot(in context: Context, completion: @escaping (ProfileEntry) -> ()) {
        let entry = ProfileEntry(date: Date(), profile: Profile())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [ProfileEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = ProfileEntry(date: entryDate, profile: Profile())
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct ProfileEntry: TimelineEntry {
    let date: Date
    let profile: Profile
}

struct ProfileWidgetEntryView : View {
    @Environment(\.widgetFamily) private var widgetFamily
    var entry: Provider.Entry

    var body: some View {
        switch widgetFamily {
        case .systemMedium:
            MediumProfileWidget(entry: entry)
        default:
            Text("Hello")
        }
        
        
    }
}

// Medium Size Widget

struct MediumProfileWidget: View {
    var entry: Provider.Entry
    
    var body: some View {
        ZStack {
            Color(.systemOrange)
            HStack {
                Image(uiImage: ImageManager.urlToImage(from: entry.profile.profileImg) ?? UIImage())
                    .resizable()
                    .frame(width: 85, height: 85, alignment: .center)
                    .aspectRatio(contentMode: .fill)
                VStack(alignment: .leading) {
                    Spacer()
                    Text(entry.profile.name)
                        .font(.headline)
                        .fontWeight(.bold)
                    Text(entry.profile.job)
                        .font(.caption)
                        .fontWeight(.thin)
                    Spacer()
                    Text(entry.profile.email)
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
        .supportedFamilies([.systemMedium])
    }
}

struct ProfileWidget_Previews: PreviewProvider {
    static var previews: some View {
        ProfileWidgetEntryView(entry: ProfileEntry(date: Date(), profile: Profile()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
