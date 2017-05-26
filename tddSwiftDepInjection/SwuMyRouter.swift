//
//  SwuMyRouter.swift
//  tddSwiftDepInjection
//


import Foundation

public protocol MyUrlHandling {
    func open(_ url: URL, options: [String : Any], completionHandler completion: ((Bool) -> Void)?)
}


public class SwuMyRouterConstructorInjected {
    
    let urlHandling: MyUrlHandling
    
    public init(_ myUrlHandling: MyUrlHandling) {
        urlHandling = myUrlHandling
    }
    
    public func google(_ searchString: String) {
        if let url = URL(string: "https://www.google.ca/#q=" + searchString) {
            urlHandling.open(url, options: [:], completionHandler: nil)
        }
    }
    
}

public class SwuMyRouterPropertyInjected {
    
    public var urlHandling: MyUrlHandling!
    
    public func google(_ searchString: String) {
        if let url = URL(string: "https://www.google.ca/#q=" + searchString) {
            urlHandling.open(url, options: [:], completionHandler: nil)
        }
    }
    
}
