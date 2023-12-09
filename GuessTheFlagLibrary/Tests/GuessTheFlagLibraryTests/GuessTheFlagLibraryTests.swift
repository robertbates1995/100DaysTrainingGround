import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

// Macro implementations build for the host, so the corresponding module is not available when cross-compiling. Cross-compiled tests may still make use of the macro itself in end-to-end tests.
#if canImport(GuessTheFlagLibraryMacros)
import GuessTheFlagLibraryMacros

let testMacros: [String: Macro.Type] = [
    "stringify": StringifyMacro.self,
    "DidChange": DidChangeMacro.self
]
#endif

final class GuessTheFlagLibraryTests: XCTestCase {
    func testMacro() throws {
#if canImport(GuessTheFlagLibraryMacros)
        assertMacroExpansion(
            """
            #stringify(a + b)
            """,
            expandedSource: """
            (a + b, "a + b")
            """,
            macros: testMacros
        )
#else
        throw XCTSkip("macros are only supported when running tests for the host platform")
#endif
    }
    
    func testMacroWithStringLiteral() throws {
#if canImport(GuessTheFlagLibraryMacros)
        assertMacroExpansion(
            #"""
            #stringify("Hello, \(name)")
            """#,
            expandedSource: #"""
            ("Hello, \(name)", #""Hello, \(name)""#)
            """#,
            macros: testMacros
        )
#else
        throw XCTSkip("macros are only supported when running tests for the host platform")
#endif
    }
    
    func testDidChangeMacro() throws {
#if canImport(GuessTheFlagLibraryMacros)
        assertMacroExpansion(
    #"""
    @DidChange
    struct Bar {
    var test1: Int
    }
    """#,
    expandedSource:
        //add private next
    #"""
    struct Bar {
    var _test1: Int
    }
    """#,
    macros: testMacros
        )
#else
        throw XCTSkip("macros are only supported when running tests for the host platform")
#endif
    }
}
