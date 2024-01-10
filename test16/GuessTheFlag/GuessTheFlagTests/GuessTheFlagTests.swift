//
//  GuessTheFlagTests.swift
//  GuessTheFlagTests
//
//  Created by Robert Bates on 10/30/23.
//

import XCTest
@testable import GuessTheFlag
import StateTesting

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
    lazy var foo = StateTester(given: {TestState(self.sut)})
    
    func testCorrectFlagTapped() {
        foo.when({sut.flagTapped(sut.correctAnswer)}) {
            $0.change(\.showingScore, true)
            $0.change(\.scoreTitle, "Correct")
            $0.change(\.userScore, 1)
        }
    }
    
    func testWrongFlagTapped() {
        let incorectAnswer = sut.correctAnswer == 0 ? 1 : 0
        foo.when({sut.flagTapped(incorectAnswer)}){
            //$0.change(\.showingScore, true)
            $0.change(\.scoreTitle, "Wrong, that's \(sut.countries[incorectAnswer])")
        }
    }
    
    func testAskQuestion() {
        foo.when({sut.askQuestion()}) {
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
