//
//  RockPaperScissorsSolveTests.swift
//  RockPaperScissorsSolveTests
//
//  Created by Robert Bates on 12/20/23.
//

import XCTest
@testable import RockPaperScissorsSolve
import StateTesting

final class RockPaperScissorsSolveTests: XCTestCase {
    
    let sut = ContentModel(move: .paper, goal: .win)

    func testWinningMove() {
        XCTAssertEqual(ContentModel(move: .paper, goal: .win).winningMove, .scissors)
        XCTAssertEqual(ContentModel(move: .paper, goal: .lose).winningMove, .rock)
        XCTAssertEqual(ContentModel(move: .rock, goal: .win).winningMove, .paper)
        XCTAssertEqual(ContentModel(move: .rock, goal: .lose).winningMove, .scissors)
        XCTAssertEqual(ContentModel(move: .scissors, goal: .win).winningMove, .rock)
        XCTAssertEqual(ContentModel(move: .scissors, goal: .lose).winningMove, .paper)
    }
    
    func testButtonPress() {
        let sut = ContentModel(move: .paper, goal: .win, moveQueue: [(.scissors, .lose)])
        sut.choseMove(.scissors)
        XCTAssertEqual(sut.points, 1)
        XCTAssertEqual(sut.totalAsked, 2)
        XCTAssertEqual(sut.move, .scissors)
        XCTAssertEqual(sut.goal, .lose)
        XCTAssertEqual(sut.isDone, false)
        sut.choseMove(.paper)
        XCTAssertEqual(sut.isDone, true)
    }
    
    func testAskAllQuestions() {
        let sut = ContentModel(
            move: .paper,
            goal: .win,
            moveQueue: [(.paper, .win), (.paper, .win), (.paper, .win),
                        (.paper, .win), (.paper, .win), (.paper, .win),
                        (.paper, .win), (.paper, .win), (.paper, .win),])
        for _ in (1...9) {
            sut.choseMove(.scissors)
        }
        sut.choseMove(.paper)
        XCTAssertEqual(sut.isDone, true)
        XCTAssertEqual(sut.points, 9)
        XCTAssertEqual(sut.totalAsked, 10)
    }
}
