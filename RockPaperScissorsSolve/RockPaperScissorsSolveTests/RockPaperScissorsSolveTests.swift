//
//  RockPaperScissorsSolveTests.swift
//  RockPaperScissorsSolveTests
//
//  Created by Robert Bates on 12/20/23.
//

import XCTest
@testable import RockPaperScissorsSolve
import StateTesting

struct TestState: Equatable {
    var move: String
    var goal: String
    var winningMove: String
    
    init(_ model: ContentModel) {
        self.move = model.move
        self.goal = model.goal
        self.winningMove = model.winningMove
    }
}

final class RockPaperScissorsSolveTests: XCTestCase {
    
    let sut = ContentModel()

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

    

}
