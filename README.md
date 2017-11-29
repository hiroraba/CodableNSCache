# CodableNSCache
[![Build Status](https://travis-ci.org/hiroraba/CodableNSCache.svg?branch=master)](https://travis-ci.org/hiroraba/CodableNSCache)

Simple Wrapper NSCache for Codable Protocol 

```swift
struct Person:Codable {
    var name:String
    var address:String
}

let cache = CodableCache<Person>()
let person = Person(name: "hiroraba", address: "kyoto")
cache.setObject(obj: person, forKey: "example")
let p = cache.objectForKey(forKey: "example")
print(p?.name) => "hiroraba"
```

## Requirements

- iOS 8.0+
- Swift3.2+

## Installation

#### CocoaPods
```ruby
platform :ios, '8.0'
use_frameworks!
pod 'CodableNSCache'
```

#### Carthage
Create a `Cartfile` that lists the framework and run `carthage update`. Follow the [instructions](https://github.com/Carthage/Carthage#if-youre-building-for-ios) to add `$(SRCROOT)/Carthage/Build/iOS/CodableNSCache.framework` to an iOS project.

```
github "hiroraba/CodableNSCache"
```

#### Manually
1. Download and drop ```CodableNSCache.swift``` in your project.  
2. Congratulations!  


## Contribute

We would love you for the contribution, check the ``LICENSE`` file for more info.
