//
//  AllInTests.swift
//  AllInTests
//
//  Created by Emre KARTAL on 19/09/2023.
//

import XCTest
@testable import AllIn

final class AllInTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
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
