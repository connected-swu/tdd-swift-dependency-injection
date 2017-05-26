//
//  MyDataUpdateResponder.swift
//  tddSwiftDepInjection
//


import Foundation


public protocol DataConsumer {
    func update(data: Any?)
}

public class MyDataUpdateResponder {
    
    public func add(consumer: DataConsumer) {
        
    }
    
}

