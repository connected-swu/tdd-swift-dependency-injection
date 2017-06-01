//
//  MyDataUpdateResponderSpec.swift
//  tddSwiftDepInjection
//
//  Created by cl-dev on 2017-05-25.
//  Copyright © 2017 Steven Wu. All rights reserved.
//

import Quick
import Nimble
@testable import tddSwiftDepInjection

class MyDataConsumer: DataConsumer {
    var didGetData: Bool = false
    
    func update(data: Any?) {
        self.didGetData = true
    }
}

class MyDataUpdateResponderSpec: QuickSpec {
    override func spec() {
        describe("data update responder") {
            var sut: MyDataUpdateResponder!
            var consumer1: MyDataConsumer!
            var consumer2: MyDataConsumer!
            var testNotificationCenter: NotificationCenter!
            
            beforeEach {
                testNotificationCenter = NotificationCenter()
                sut = MyDataUpdateResponder(testNotificationCenter)
                consumer1 = MyDataConsumer()
                consumer2 = MyDataConsumer()
            }
            
            it("should publish updates to a data consumer") {
                sut.add(consumer: consumer1)
                testNotificationCenter.post(name: NSNotification.Name(rawValue: "fresh_data"), object: nil)
                expect(consumer1.didGetData).to(beTrue())
            }
            
            it("should publish updates to multiple data consumers") {
                sut.add(consumer: consumer1)
                sut.add(consumer: consumer2)
                testNotificationCenter.post(name: NSNotification.Name(rawValue: "fresh_data"), object: nil)
                expect(consumer1.didGetData).to(beTrue())
                expect(consumer2.didGetData).to(beTrue())
            }
        }
    }
}
