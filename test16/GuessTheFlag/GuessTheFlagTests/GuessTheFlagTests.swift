//
//  GuessTheFlagTests.swift
//  GuessTheFlagTests
//
//  Created by Robert Bates on 10/30/23.
//

import XCTest
@testable import GuessTheFlag

struct SimpleState: Equatable {
    var test1: Int
}

struct Wrapper<T> {
    private(set) var value: T
    
    init(_ value: T) {
        self.value = value
    }
    
    mutating func change<D: Equatable>(_ path: WritableKeyPath<T, D>,
                                       _ newValue: D,
                                       file: StaticString = #filePath,
                                       line: UInt = #line) {
        XCTAssertNotEqual(newValue, self.value[keyPath: path], file: file, line: line)
        self.value[keyPath: path] = newValue
    }
}

func verify<State: Equatable>(given: ()->State,
                              when: ()->(),
                              then: (inout Wrapper<State>)->(),
                              file: StaticString = #filePath,
                              line: UInt = #line) {
    var wrappedState = Wrapper<State>(given())
    then(&wrappedState)
    when()
    let newState = given()
    XCTAssertEqual(wrappedState.value, newState, file: file, line: line)
}

func verify<State: Equatable>(given: ()->State,
                              when: ()throws->(),
                              then: (inout Wrapper<State>)->(),
                              file: StaticString = #filePath,
                              line: UInt = #line) throws {
    var wrappedState = Wrapper<State>(given())
    then(&wrappedState)
    try when()
    let newState = given()
    XCTAssertEqual(wrappedState.value, newState, file: file, line: line)
}

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
    
    let sut = ContentModel()
    func when(_ change: ()->(), _ then: (inout Wrapper<TestState>)->(), file: StaticString = #filePath, line: UInt = #line)->() {
        verify(given: {TestState(sut)}, when: change, then: then, file: file, line: line)
    }
    
    func testCorrectFlagTapped() {
        when({sut.flagTapped(sut.correctAnswer)}) {
            $0.change(\.showingScore, true)
            $0.change(\.scoreTitle, "Correct")
            $0.change(\.userScore, 1)
        }
    }
    
    func testWrongFlagTapped() {
        let incorectAnswer = sut.correctAnswer == 0 ? 1 : 0
//        when({sut.flagTapped(incorectAnswer)}){
//            $0.showingScore = true
//            $0.scoreTitle = "Wrong, that's \(sut.countries[incorectAnswer])"
//            $0.userScore = 0
//        }
    }
    
    func testAskQuestion() {
        when({sut.askQuestion()}) {
            $0.change(\.totalAsked, 2)
        }
    }
    
    func testCorrectThenWrong() {
        sut.flagTapped(sut.correctAnswer)
        sut.askQuestion()
        let incorectAnswer = sut.correctAnswer == 0 ? 1 : 0
//        when({sut.flagTapped(incorectAnswer)}) {
//                $0.showingScore = true
//                $0.scoreTitle = "Wrong, that's \(sut.countries[incorectAnswer])"
//                $0.userScore = 1
//            }
    }
    
    
}
