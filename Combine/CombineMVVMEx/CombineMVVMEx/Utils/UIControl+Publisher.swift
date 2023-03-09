//
//  UIControl+Publisher.swift
//  CombineMVVMEx
//
//  Created by 서보경 on 2023/03/09.
//

// 참고: https://velog.io/@aurora_97/Combine-UIKit에서-Combine-편하게-쓰기

import Combine
import UIKit

extension UIControl {
    func controlPublisher(for event: UIControl.Event) -> UIControl.EventPublisher {
        return UIControl.EventPublisher(control: self, event: event)
    }
    
    struct EventPublisher: Publisher {
        typealias Output = UIControl
        typealias Failure = Never
        
        let control: UIControl
        let event: UIControl.Event
        
        func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, UIControl == S.Input {
            let subscription = EventSubscription(control: control, subscriber: subscriber, event: event)
            subscriber.receive(subscription: subscription)
        }
    }
    
    fileprivate class EventSubscription<EventSubscriber: Subscriber>: Subscription where EventSubscriber.Input == UIControl, EventSubscriber.Failure == Never {
        let control: UIControl
        let event: UIControl.Event
        var subscriber: EventSubscriber?
        
        init(control: UIControl, subscriber: EventSubscriber, event: UIControl.Event) {
            self.control = control
            self.subscriber = subscriber
            self.event = event
            
            control.addTarget(self, action: #selector(eventDidOccur), for: event)
        }
        
        func request(_ demand: Subscribers.Demand) {}
        
        func cancel() {
            subscriber = nil
            control.removeTarget(self, action: #selector(eventDidOccur), for: event)
        }
        
        @objc func eventDidOccur() {
            _ = subscriber?.receive(control)
        }
    }
}
