//
//  SwuMyDataUpdateResponderSpec.swift
//  tddSwiftDepInjection
//
//  Created by cl-dev on 2017-05-25.
//  Copyright © 2017 Steven Wu. All rights reserved.
//

import Quick
import Nimble
@testable import tddSwiftDepInjection

class TestDataConsumer: DataConsumer {
    var lastData: Any?
    func update(data: Any?) {
        lastData = data
    }
}


class SwuMyDataUpdateResponderSpec: QuickSpec {
    override func spec() {
        xdescribe("data update responder") {
            var subject: SwuMyDataUpdateResponder!
            var testNotificationCenter: NotificationCenter!
            var testDataConsumer1: TestDataConsumer!
            var testDataConsumer2: TestDataConsumer!
            
            beforeEach {
                testNotificationCenter = NotificationCenter()
                testDataConsumer1 = TestDataConsumer()
                testDataConsumer2 = TestDataConsumer()
                subject = SwuMyDataUpdateResponder(notificationCenter: testNotificationCenter)
            }
            
            it("should publish updates to a data consumer") {
                subject.add(consumer: testDataConsumer1)
                testNotificationCenter.post(name: Notification.Name("fresh_data"), object: "data_content")
                
                expect(testDataConsumer1.lastData as? String).to(equal("data_content"))
            }
            
            it("should publish updates to multiple data consumers") {
                subject.add(consumer: testDataConsumer1)
                subject.add(consumer: testDataConsumer2)
                testNotificationCenter.post(name: Notification.Name("fresh_data"), object: "data_content_again")
                
                expect(testDataConsumer1.lastData as? String).to(equal("data_content_again"))
                expect(testDataConsumer2.lastData as? String).to(equal("data_content_again"))
            }
            
        }
    }
}
