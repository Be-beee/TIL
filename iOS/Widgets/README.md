# Simple Widget Guide

<div align="center">
    <img src="./images/timeline_wwdc.png" width="85%">
    <img src="https://docs-assets.developer.apple.com/published/213aa7307c9285983f452058dce9eebe/11800/WidgetKit-Timeline-After-Date@2x.png" width="45%">
</div>
<br>

iOS에서의 Widget Extension은 `TimelineProvider`에서 지정한 시간 옵션에 따라 `TimelineEntry`를 업데이트하는 방식으로 동작한다.<br>
타임라인은 `getTimeline`메서드에서 array 형식으로 얻어오고, `getSnapshot` 메서드를 통해 특정 시간에 맞는 `TimelineEntry`를 가져오게 된다.<br>
위젯은 크기에 따라 small, medium, large로 분류되며, `widgetFamily`를 통해 각 위젯 크기에 따라 다른 UI를 적용시킬 수 있다.<br>
<br>
<br>

```swift
// MARK:- 사용 예시

struct ProfileWidgetEntryView : View {
    @Environment(\.widgetFamily) private var widgetFamily
    var entry: Provider.Entry

    var body: some View {
        switch widgetFamily {
        case .systemMedium:
            MediumProfileWidget(entry: entry)
        default:
            SmallProfileWidget(entry: entry)
        }
        
        
    }
}

// ... 중략

@main
struct ProfileWidget: Widget {
    let kind: String = "ProfileWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            ProfileWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemMedium])  // 지원할 위젯 크기를 지정할 수 있다.
    }
}
```

<br>
<br>

## Static Widget

<div align="center">
	<img src="./images/static_widget.png" width="25%">
	<img src="./images/static_main.png" width="25%">
</div>

위젯 편집 기능이 포함되지 않은 정적(Static) 위젯. <br>
`StaticConfiguration`이 사용되는 위젯 타입이다.<br>
<br>
> ### StaticConfiguration <br>
> An object describing the content of a widget that has no user-configurable options.
> ##### References: https://developer.apple.com/documentation/widgetkit/staticconfiguration
<br>


```swift
struct ProfileWidget: Widget {
    let kind: String = "ProfileWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            ProfileWidgetEntryView(entry: entry)
        }
	// ...
    }
}
```
<br>
<br>

## Dynamic Widget

작성 예정.
<br>
<br>

## References

- [Meet WidgetKit](https://developer.apple.com/videos/play/wwdc2020/10028/)
- [Making a Configurable Widget](https://developer.apple.com/documentation/widgetkit/making-a-configurable-widget)
- [Keeping a Widget Up To Date](https://developer.apple.com/documentation/widgetkit/keeping-a-widget-up-to-date)
- [StaticConfiguration](https://developer.apple.com/documentation/widgetkit/staticconfiguration)
