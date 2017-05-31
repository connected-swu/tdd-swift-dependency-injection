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


class UIApplicationMockInstance: URLHandler {
    var url : String?
    
    func open(_ url: URL, options: [String : Any], completionHandler completion: ((Bool) -> Swift.Void)?) {
        self.url = url.absoluteString
    }

}

class MyRouterSpec: QuickSpec {
    override func spec() {
        describe("router") {
            var subject: MyRouter!
            
            var testUIApplication = UIApplicationMockInstance()
            
       

            beforeEach {
                subject = MyRouter(testUIApplication)
                
                subject.google("hello")
            }
            
            it("should send user to google with correct query") {
                //huh?
                //https://www.google.ca/#q=hello
                expect(testUIApplication.url).to(equal("https://www.google.ca/#q=hello"))
                
            }
        }
        
        describe("router property injection") {
            var subject: MyRouterProperty!
            
            let testUIApplication = UIApplicationMockInstance()
            
            
            
            beforeEach {
                subject = MyRouterProperty()
                subject.urlHandler = testUIApplication
                subject.google("hello")
            }
            
            it("should send user to google with correct query") {
                //huh?
                //https://www.google.ca/#q=hello
                expect(testUIApplication.url).to(equal("https://www.google.ca/#q=hello"))
                
            }
        }
    }
}

