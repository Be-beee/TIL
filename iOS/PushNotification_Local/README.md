# 등록된 전체 Request 목록 확인 방법

```swift
let center = UNUserNotificationCenter.current()
center.getPendingNotificationRequests { (requests) in
    for req in requests {
        print(req)
        print("-----------------------------------")
    }
}
```