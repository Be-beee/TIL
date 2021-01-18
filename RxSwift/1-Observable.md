# Observable

메서드 호출 대신, 데이터를 회수하고 변형시키는 메커니즘. <br>

`Observable` 에서 하나 또는 일련의 객체들을 반환할 때, `Observable`을 지켜보고 있는(subscribe) 옵저버가 반환된 객체를 읽어들인다.<br>

이러한 접근의 장점은 프로그래머가 다루는 다수의 작업들이 서로를 간섭하지 않을 때 작업을 비동기적으로 처리하기 용이해진다는 것이다. 이로 인해 각 작업을 동기적으로 처리할 때보다 훨씬 적은 시간이 들게 된다. (아래 인용문 참조.)

>An advantage of this approach is that when you have a bunch of tasks that are not dependent on each other, you can start them all at the same time rather than waiting for each one to finish before starting the next one — that way, your entire bundle of tasks only takes as long to complete as the longest task in the bundle.

Observable의 생성은 `create()` 를 통해 가능하다.

```swift
import RxSwift

func downloadJson(_ url: String) -> Observable<String?> {
// MARK:- 비동기로 생기는 데이터를 Observable로 감싸서 리턴하는 방법
	return Observable.create() { emitter in
		let url = URL(string: url)!
		let task = URLSession.shared.dataTask(with: url) { (data, _, err) in
			guard err == nil else {
				emitter.onError(err!)
			}

			if let data = data, let json = String(data: data, encoding: .utf8) {
				emitter.onNext(json) // onNext(): 여러 개의 데이터가 전달되어도 됨
			}
			emitter.onCompleted()
		}
		task.resume()

		return Disposables.create() { // 작업 종료/중지
			task.cancel()
		}
	}
}
```

```swift
// MARK:- Observable로 오는 데이터를 받아서 처리하는 방법
downloadJson(MEMBER_LIST_URL)
		.subscribe { event in
			switch event {
			case let .next(json):
				DispatchQueue.main.async {
					self.editView.text = json
					self.setVisibleWithAnimation(self.activityIndicator, false)
				}
			case .completed:
				break
			case .error:
				break
			}
		}
```

<br><br>

## Observable의 생명 주기

1. create
2. subscribe
3. onNext
4. onCompleted / onError
5. disposed

<br><br>

## Hot Observable vs Cold Observable

>A “hot” Observable may begin emitting items as soon as it is created, and so any observer who later subscribes to that Observable may start observing the sequence somewhere in the middle. A “cold” Observable, on the other hand, waits until an observer subscribes to it before it begins to emit items, and so such an observer is guaranteed to see the whole sequence from the beginning.

<br><br>

## Observable Operators 비교하기

<br><br>

## References

- [ReactiveX - Observable](http://reactivex.io/documentation/ko/observable.html)
- [RxSwift 4시간 만에 끝내기](https://www.youtube.com/watch?v=w5Qmie-GbiA&t=4842s)

