//
//  CodableNSCache.swift
//  CodableNSCache
//
//  Created by matsuohiroki on 2017/11/28.
//  Copyright © 2017年 matsuohiroki. All rights reserved.
//

import Foundation

struct CodableNSCache<T:Codable> {
    
    private var cache = NSCache<AnyObject, AnyObject>()
    
    var name: String {
        get {
            return cache.name
            
        }
        set {
            cache.name = newValue
            
        }
    }
    
    func objectForKey(forKey key:String,
                                 decorder:JSONDecoder = JSONDecoder()) -> T? {
        return objectForKey(forKey: key as AnyObject)
    }
    
    func objectForKey<T:Codable>(forKey key:AnyObject,
                                 decoder:JSONDecoder = JSONDecoder()) -> T?  {
        guard let data = cache.object(forKey: key) as? Data else {
            return nil
        }
        return try? decoder.decode(T.self, from: data)
    }
    
    func setObject(obj:T, forKey key:String, encoder:JSONEncoder = JSONEncoder()) {
        if let data = try? encoder.encode(obj)  {
            cache.setObject(data as AnyObject, forKey: key as AnyObject)
        }
    }
    
    func setObject(obj:T, forKey key:AnyObject, encoder:JSONEncoder = JSONEncoder()) {
        if let data = try? encoder.encode(obj)  {
            cache.setObject(data as AnyObject, forKey: key)
        }
    }
    
    func removeObjectForKey(key: AnyObject) {
        self.cache.removeObject(forKey: key)
    }
    
    func removeAllObjects() {
        self.cache.removeAllObjects()
    }
    
    subscript(key: AnyObject) -> T? {
        get {
            return objectForKey(forKey: key)
        }
        set(obj) {
            if let data = try? JSONEncoder().encode(obj)  {
                cache.setObject(data as AnyObject, forKey: key)
            }
        }
    }
    
    subscript(key: String) -> T? {
        get {
            return objectForKey(forKey: key as AnyObject)
        }
        set(obj) {
            if let data = try? JSONEncoder().encode(obj)  {
                cache.setObject(data as AnyObject, forKey: key as AnyObject)
            }
        }
    }
    
    var totalCostLimit: Int {
        
        get {
            return self.cache.totalCostLimit
            
        }
        
        set {
            self.cache.totalCostLimit = newValue
            
        }
    }
    
    var countLimit: Int {
        get {
            return self.cache.countLimit
            
        }
        set {
            self.cache.countLimit = newValue
            
        }
    }
    
    var evictsObjectsWithDiscardedContent: Bool {
        get {
            return self.cache.evictsObjectsWithDiscardedContent
            
        }
        set {
            self.evictsObjectsWithDiscardedContent = newValue
            
        }
    }
}
