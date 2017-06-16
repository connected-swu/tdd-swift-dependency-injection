//
//  MyRouterSpec.swift
//  tddSwiftDepInjection
//
//  Created by cl-dev on 2017-05-25.
//  Copyright © 2017 Steven Wu. All rights reserved.
//

import Quick
import Nimble
@testable import tddSwiftDepInjection

class MyRouterSpec: QuickSpec {
    override func spec() {
        xdescribe("router") {
            var subject: MyRouter!
            beforeEach {
                subject = MyRouter()
                subject.google("hello")
            }
            it("should send user to google with correct query") {
                //huh?  is there a missing dependency or hidden state?
                //https://www.google.ca/#q=hello
            }
        }
    }
}

