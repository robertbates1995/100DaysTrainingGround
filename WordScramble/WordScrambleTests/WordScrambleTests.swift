//
//  WordScrambleTests.swift
//  WordScrambleTests
//
//  Created by Robert Bates on 1/4/24.
//

import XCTest
@testable import WordScramble

final class WordScrambleTests: XCTestCase {
    let sut = ContentModel()
    
    func testAddNewWordToEmptyArray() {
        let testWord = "abetting"
        let sut = ContentModel(rootWord: testWord, newWord: testWord)
        sut.addNewWord()
        XCTAssertEqual(sut.usedWords, [testWord])
    }
    
    func testAddNewWordToPopulatedArray() {
        let testWord = "abetting"
        let sut = ContentModel(usedWords: ["word1"], rootWord: testWord, newWord: testWord)
        sut.addNewWord()
        XCTAssertEqual(sut.usedWords, [testWord, "word1"])
    }
    
    func testAddRepeatedWord() {
        let testWord = "abetting"
        let sut = ContentModel(usedWords: [testWord], rootWord: testWord, newWord: testWord)
        sut.addNewWord()
        XCTAssertEqual(sut.usedWords, [testWord])
    }
}
