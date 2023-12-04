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
    var totalAsked: Int {
        get{return _totalAsked}
        set{
            XCTAssertNotEqual(_totalAsked, newValue)
            _totalAsked = newValue
        }
    }
    private var _totalAsked: Int
    
    init(_ model: ContentModel) {
        self.countries = Set(model.countries)
        self.showingScore = model.showingScore
        self.scoreTitle = model.scoreTitle
        self.userScore = model.userScore
        self._totalAsked = model.totalAsked
    }
}

func bdd<State: Equatable>(given: ()->State, when: ()->(), then: (inout State)->()) {
    var expectedState = given()
    then(&expectedState)
    when()
    let newState = given()
    XCTAssertEqual(expectedState, newState)
}

final class GuessTheFlagTests: XCTestCase {
    
    let sut = ContentModel()
    func when(_ change: ()->(), _ then: (inout TestState)->())->() {
        bdd(given: {TestState(sut)}, when: change, then: then)
    }
    
    func testCorrectFlagTapped() {
        when({sut.flagTapped(sut.correctAnswer)}) {
            $0.showingScore = true
            $0.scoreTitle = "Correct"
            $0.userScore = 1
        }
    }
    
    func testWrongFlagTapped() {
        let incorectAnswer = sut.correctAnswer == 0 ? 1 : 0
        when({sut.flagTapped(incorectAnswer)}){
            $0.showingScore = true
            $0.scoreTitle = "Wrong, that's \(sut.countries[incorectAnswer])"
            $0.userScore = 0
        }
    }
    
    func testCorrectThenWrong() {
        let incorectAnswer = sut.correctAnswer == 0 ? 1 : 0
        when({sut.flagTapped(sut.correctAnswer)
            sut.flagTapped(incorectAnswer)}) {
                $0.showingScore = true
                $0.scoreTitle = "Wrong, that's \(sut.countries[incorectAnswer])"
                $0.userScore = 1
                $0.totalAsked = 2
            }
    }
    
    func testAskQuestion() {
        when({sut.askQuestion()}) {
            $0.totalAsked = 1
        }
    }
}
