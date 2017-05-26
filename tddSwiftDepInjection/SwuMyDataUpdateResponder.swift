//
//  SwuMyDataUpdateResponder.swift
//  tddSwiftDepInjection
//


import Foundation

public class SwuMyDataUpdateResponder {
    
    let notificationCenter: NotificationCenter
    var consumers: [DataConsumer]
    
    public init(notificationCenter: NotificationCenter) {
        consumers = []
        self.notificationCenter = notificationCenter
        self.notificationCenter .addObserver(self, selector: #selector(handle(freshDataNotification:)), name: Notification.Name("fresh_data"), object: nil)
    }
    
    public func add(consumer: DataConsumer) {
        consumers.append(consumer)
    }
    
    @objc public func handle(freshDataNotification: Notification) {
        for consumer in consumers {
            consumer.update(data: freshDataNotification.object)
        }
    }
    
}
