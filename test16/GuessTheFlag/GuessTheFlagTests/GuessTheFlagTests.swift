//
//  GuessTheFlagTests.swift
//  GuessTheFlagTests
//
//  Created by Robert Bates on 10/30/23.
//

import XCTest
@testable import GuessTheFlag

struct TestState: Equatable {
    var countries: Set<String>
    var showingScore: Bool
    var scoreTitle: String
    var userScore: Int
    var totalAsked: Int
    
    init(_ model: ContentModel) {
        self.countries = Set(model.countries)
        self.showingScore = model.showingScore
        self.scoreTitle = model.scoreTitle
        self.userScore = model.userScore
        self.totalAsked = model.totalAsked
    }
}

final class GuessTheFlagTests: XCTestCase {
    func testExample() throws {
        let sut = ContentModel()
        XCTAssertEqual(Set(sut.countries), Set(["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]))
        XCTAssertFalse(sut.showingScore)
        XCTAssertEqual(sut.scoreTitle, "")
        XCTAssertEqual(sut.userScore, 0)
        XCTAssertEqual(sut.totalAsked, 0)
    }
    
    func testRightFlagTapped() {
        let sut = ContentModel()
        var expectedState = TestState(sut)
        expectedState.showingScore = true
        expectedState.scoreTitle = "Correct"
        expectedState.userScore = 1
        expectedState.totalAsked = 1
        sut.flagTapped(sut.correctAnswer)
        XCTAssertEqual(TestState(sut), expectedState)
    }
    
    func testWrongFlagTapped() {
        let sut = ContentModel()
        let local = sut.correctAnswer == 0 ? 1 : 0
        sut.flagTapped(local)
        XCTAssertTrue(sut.showingScore)
        XCTAssertEqual(sut.scoreTitle, "Wrong, that's \(sut.countries[local])")
        XCTAssertEqual(sut.userScore, 0)
        XCTAssertEqual(sut.totalAsked, 1)
    }
    
    func testRightThenWrong() {
        let sut = ContentModel()
        sut.flagTapped(sut.correctAnswer)
        let local = sut.correctAnswer == 0 ? 1 : 0
        sut.flagTapped(local)
        XCTAssertTrue(sut.showingScore)
        XCTAssertEqual(sut.scoreTitle, "Wrong, that's \(sut.countries[local])")
        XCTAssertEqual(sut.userScore, 1)
        XCTAssertEqual(sut.totalAsked, 2)
    }
    
    func testAskQuestion() {
        let sut = ContentModel()
        var expectedState = TestState(sut)
        sut.askQuestion()
        XCTAssertEqual(TestState(sut), expectedState)
    }
}
