//
//  File.swift
//  
//
//  Created by Dylan Elliott on 18/12/2023.
//

import Foundation
import Armstrong
import SwiftUI
import DylKit

final class DateValue: EditableVariableValue {
    static var type: VariableType { .date }
    
    var protoString: String { "\(value.formatted())"}
    var valueString: String { protoString }
    
    @Published var value: Date
    
    init(value: Date) {
        self.value = value
    }
    
    func value(with variables: Variables) async throws -> VariableValue {
        self
    }
    
    static func makeDefault() -> DateValue {
        DateValue(value: .now)
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(.date, "add")
    }
    
    func editView(scope: Scope, title: String, onUpdate: @escaping (DateValue) -> Void) -> AnyView {
        return ExpandableStack(scope: scope, title: title) {
            HStack {
                ProtoText(self.protoString)
            }
        } content: {
            DatePicker(selection: .init(get: { [weak self] in
                self?.value ?? .now
            }, set: { [weak self] in
                guard let self else { return }
                self.value = $0
                onUpdate(self)
            })) {
                Text("Hello")
            }
        }.any
    }
}

extension DateValue: CodeRepresentable {
    var codeRepresentation: String { "TODO" }
}
