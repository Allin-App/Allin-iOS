//
//  DependancyInjection.swift
//  AllIn
//
//  Created by Emre on 20/10/2023.
//

import Foundation

class DependencyInjection {
    static var shared = DependencyInjection()
    private var singletons = [String: Any]()
    
    @discardableResult
    func addSingleton<T>(_ type: T.Type, _ instance: T) -> DependencyInjection {
        let key = String(describing: T.self)
        singletons[key] = instance
        return self
    }

    func resolve<T>(_ type: T.Type) -> T? {
        let key = String(describing: T.self)
        return singletons[key] as? T
    }
}

@propertyWrapper
struct Inject<T> {
    private var value: T?

    init() {
        self.value = DependencyInjection.shared.resolve(T.self)
    }
    
    var wrappedValue: T {
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
