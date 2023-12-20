//
//  AllInTests.swift
//  AllInTests
//
//  Created by Emre on 19/09/2023.
//

import XCTest
@testable import AllIn

final class AllInTests: XCTestCase {
    
    func testInstance() {
        DependencyInjection.shared.addSingleton(UserTest.self, UserTest(age: 10))
        let view1 = View1()
        let view2 = View2()
        XCTAssertEqual(view1.getAge(), view2.getAge())
        
        view1.setAge()
        XCTAssertEqual(view1.getAge(), view2.getAge())
        
        view2.setAge()
        XCTAssertEqual(view1.getAge(), view2.getAge())
    }
    
    class UserTest {
        public var age:Int
        init(age:Int) {
            self.age = age
        }
    }
    
    class View1 {
        @Inject private var user:UserTest
        func getAge() -> Int {
            return user.age
        }
        func setAge() {
            user.age = 20
        }
    }
    
    class View2 {
        @Inject private var user:UserTest
        func getAge() -> Int {
            return user.age
        }
        func setAge() {
            user.age = 40
        }
    }
    
}
