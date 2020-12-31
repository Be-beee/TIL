# Form & ScrollView

## ScrollView

```swift
ScrollView(_ axes:, showsIndicators:, contents:)
```
`axes`를 통해 스크롤 방향을 지정할 수 있고, `showsIndicators`를 통해 스크롤 바 화면 표시 여부를 지정할 수 있다.

```swift
ScrollView(.horizontal, showsIndicators: true) {
    HStack {
        Text("Hello")
        Text("Hello1")
        Text("Hello2")
        Text("Hello3")
        Text("Hello4")
        Text("Hello5")
        Text("Hello6")
        Text("Hello7")
        Text("Hello8")
        Text("Hello9")
    }
}
```
<div style="text-align: center;">
	<img src="./images/scrollview.png" width="40%">
</div>


## 참고

- [Apple Developer Documentation - ScrollView](https://developer.apple.com/documentation/swiftui/scrollview)
- [Hohyeon Moon님 블로그](https://www.hohyeonmoon.com/blog/swiftui-tutorial-form-scrollview/)