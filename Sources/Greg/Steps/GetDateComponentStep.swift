//
//  File.swift
//  
//
//  Created by Dylan Elliott on 18/12/2023.
//

import Foundation
import Armstrong

public final class GetDateComponentStep: ValueStep {
    
    public static var title: String { "Get date component" }
    public static var type: VariableType { .getDateComponentStep }
    
    var date: TypedValue<DateValue>
    
    init(date: TypedValue<DateValue>) {
        self.date = date
    }
    
    public var protoString: String { "\(date.protoString).WEEK" }
    public var valueString: String { "\(date.valueString).WEEK" }
    
    public func run(with variables: Variables) async throws -> VariableValue {
        let date = try await date.value.value(with: variables)
        let week = Calendar.current.component(.weekOfYear, from: date.value)
        return IntValue(value: week)
    }

    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .date: return TypedValue.value(DateValue.makeDefault())
        }
    }
    
    public func add(_ other: VariableValue) throws -> VariableValue {
        fatalError()
    }
}

extension GetDateComponentStep: CodeRepresentable {
    public var codeRepresentation: String {
        "TODO"
    }
}

