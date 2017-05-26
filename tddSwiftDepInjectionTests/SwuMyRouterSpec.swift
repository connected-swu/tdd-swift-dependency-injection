//
//  SwuMyRouterSpec.swift
//  tddSwiftDepInjection
//
//  Created by cl-dev on 2017-05-25.
//  Copyright © 2017 Steven Wu. All rights reserved.
//

import Quick
import Nimble
import Swinject
@testable import tddSwiftDepInjection


class TestMyUrlHandling: MyUrlHandling {
    var lastUrl: URL?
    func open(_ url: URL, options: [String : Any], completionHandler completion: ((Bool) -> Void)?) {
        lastUrl = url
    }
}


class SwuMyRouterConstructorInjectedSpec: QuickSpec {
    override func spec() {
        xdescribe("router") {
            var subject: SwuMyRouterConstructorInjected!
            var testUrlHandling: TestMyUrlHandling!
            
            beforeEach {
                testUrlHandling = TestMyUrlHandling()
                subject = SwuMyRouterConstructorInjected(testUrlHandling)
                /*
                let container = Container()
                container.register(MyUrlHandling.self) { _ in testUrlHandling }
                container.register(SwuMyRouterConstructorInjected.self, factory: { r in
                    SwuMyRouterConstructorInjected(r.resolve(MyUrlHandling.self)!)
                })
                subject = container.resolve(SwuMyRouterConstructorInjected.self)
                */
                subject.google("hello")
            }
            it("should send user to google with correct query") {
                expect(testUrlHandling.lastUrl?.absoluteString).to(equal("https://www.google.ca/#q=hello"))
            }
        }
    }
}

class SwuMyRouterPropertyInjectedSpec: QuickSpec {
    override func spec() {
        xdescribe("router") {
            var subject: SwuMyRouterPropertyInjected!
            var testUrlHandling: TestMyUrlHandling!
            
            beforeEach {
                testUrlHandling = TestMyUrlHandling()
                subject = SwuMyRouterPropertyInjected()
                subject.urlHandling = testUrlHandling
                /*
                 let container = Container()
                 container.register(MyUrlHandling.self) { _ in testUrlHandling }
                 container.register(SwuMyRouterPropertyInjected.self, factory: { r in
                    let router = SwuMyRouterPropertyInjected()
                    router.urlHandling = r.resolve(MyUrlHandling.self)!
                    return router
                 })
                 subject = container.resolve(SwuMyRouterPropertyInjected.self)
                */
                subject.google("hello")
            }
            it("should send user to google with correct query") {
                expect(testUrlHandling.lastUrl?.absoluteString).to(equal("https://www.google.ca/#q=hello"))
            }
        }
    }
}
