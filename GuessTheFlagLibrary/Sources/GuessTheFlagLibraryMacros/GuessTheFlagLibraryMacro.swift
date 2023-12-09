import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

/// Implementation of the `stringify` macro, which takes an expression
/// of any type and produces a tuple containing the value of that expression
/// and the source code that produced the value. For example
///
///     #stringify(x + y)
///
///  will expand to
///
///     (x + y, "x + y")
public struct StringifyMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        guard let argument = node.argumentList.first?.expression else {
            fatalError("compiler bug: the macro does not have any arguments")
        }

        return "(\(argument), \(literal: argument.description))"
    }
}

public struct BinaryStringMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        guard let argument = node.argumentList.first?.expression
        else {
            fatalError("Compiler Bug: macro recieved no arguments")
        }
        
        let binaryString = String(Int("\(argument)")!, radix: 2)
        
        return ExprSyntax(literal: binaryString)
    }
}

enum TestError: Error {
    case testCase
    
    var description: String {
        switch self {
        case .testCase: return "Only applicable to [test]."
        }
    }
}

public struct DidChangeMacro: MemberMacro {
    public static func expansion(
        of node: SwiftSyntax.AttributeSyntax,
        providingMembersOf declaration: some SwiftSyntax.DeclGroupSyntax,
        in context: some SwiftSyntaxMacros.MacroExpansionContext
    ) throws -> [SwiftSyntax.DeclSyntax] {
        guard let structDecl = declaration.as(StructDeclSyntax.self) else {
            throw TestError.testCase
        }
        
        let member = structDecl.memberBlock.members
        
        let storedProperties = declaration.memberBlock.members
        
        for property in storedProperties {
            print(property)
        }
        return [""]
    }
}

@main
struct GuessTheFlagLibraryPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        StringifyMacro.self,
        BinaryStringMacro.self,
        DidChangeMacro.self
    ]
}
