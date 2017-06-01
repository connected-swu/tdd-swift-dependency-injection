//
//  MyDataUpdateResponder.swift
//  tddSwiftDepInjection
//


import Foundation

// fresh_data

// 1) add(consumerA)
// 2) sometime later, a "fresh_data" notification fires
// 3) all added consumers receive a `update(data)` call with the fresh data

public protocol DataConsumer {
    func update(data: Any?)
}

public class MyDataUpdateResponder {
    
    var consumer: DataConsumer?
    var consumers: [DataConsumer]
    
    public init(_ notificationCenter: NotificationCenter) {
        consumers = [DataConsumer]()a
        notificationCenter.addObserver(self, selector:#selector(freshData), name: NSNotification.Name(rawValue: "fresh_data"), object: nil)
    }
    
    public func add(consumer: DataConsumer) {
        self.consumers.append(consumer)
    }
    
    dynamic func freshData() {
        for consumer in consumers {
            consumer.update(data: nil)
        }
    }
    
}

