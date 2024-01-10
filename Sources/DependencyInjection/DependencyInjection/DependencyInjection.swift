//
//  DependencyInjection.swift
//  DependencyInjection
//
//  Created by Emre on 27/12/2023.
//

import Foundation

public class DependencyInjection {
    public static var shared = DependencyInjection()
    private var singletons = [String: Any]()
    
    @discardableResult
    public func addSingleton<T>(_ type: T.Type, _ instance: T) -> DependencyInjection {
        let key = String(describing: T.self)
        singletons[key] = instance
        return self
    }

    public func resolve<T>(_ type: T.Type) -> T? {
        let key = String(describing: T.self)
        return singletons[key] as? T
    }
}

@propertyWrapper
public struct Inject<T> {
    private var value: T?

    public init() {
        self.value = DependencyInjection.shared.resolve(T.self)
    }
    
    public var wrappedValue: T {
        get {
            if let value = value {
                return value
            } else {
                if let resolvedValue = DependencyInjection.shared.resolve(T.self) {
                    return resolvedValue
                } else {
                    fatalError("Dependency not registered in DependencyInjection.")
                }
            }
        }
        set {
            value = newValue
        }
    }
}
