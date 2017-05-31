//
//  MyRouter.swift
//  tddSwiftDepInjection
//


import Foundation

public protocol URLHandler  {
    func open(_ url: URL, options: [String : Any], completionHandler completion: ((Bool) -> Swift.Void)? )
}

public class MyRouter {
    var urlHandler : URLHandler!
    
    public init(_ urlHandler : URLHandler) {
        self.urlHandler = urlHandler
    }
    
    public func google(_ searchString: String) {
        if let url = URL(string: "https://www.google.ca/#q=" + searchString) {
            urlHandler.open(url, options: [:], completionHandler: nil)
        }
    }
}

public class MyRouterProperty {
    var urlHandler : URLHandler!
    
    public func google(_ searchString: String) {
        if let url = URL(string: "https://www.google.ca/#q=" + searchString) {
            urlHandler.open(url, options: [:], completionHandler: nil)
        }
    }
}
