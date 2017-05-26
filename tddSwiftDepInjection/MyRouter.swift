//
//  MyRouter.swift
//  tddSwiftDepInjection
//


import Foundation

public class MyRouter {
    
    public func google(_ searchString: String) {
        if let url = URL(string: "https://www.google.ca/#q=" + searchString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
}
