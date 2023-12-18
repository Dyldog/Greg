// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI
import DylKit







public final class CalendarComponentValue: PrimitiveEditableVariableValue, Codable, Copying {

    public static var type: VariableType { .calendarComponent }
    public static var defaultValue: Calendar.Component { .defaultValue }
    public var value: Calendar.Component
    public init(value: Calendar.Component) {
        self.value = value
    }
    public static func makeDefault() -> CalendarComponentValue {
        .init(value: defaultValue)
    }
    public func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(Self.type, "add")
    }
    public var protoString: String { "\(value.title)" }
    public var valueString: String { protoString }
    public func value(with variables: Variables) async throws -> VariableValue {
        self
    }
    public func copy() -> CalendarComponentValue {
        .init(
            value: value
        )
    }
}

extension CalendarComponentValue: CodeRepresentable {
    public var codeRepresentation: String {
        value.codeRepresentation
    }
}

extension Calendar.Component: Copying {
    public func copy() -> Calendar.Component {
        return self
    }
}

extension VariableType {
    public static var calendarComponent: VariableType { .init(title: "CalendarComponent") } // Calendar.Component
}








// DateValue

extension DateValue: Copying {
    public func copy() -> DateValue {
        return DateValue(
                    value: value
        )
    }
}


extension VariableType {
    public static var date: VariableType { .init(title: "Date") } // DateValue
}

extension DateValue {
    enum CodingKeys: String, CodingKey {
        case value
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            value: (try? valueContainer.decode(Date.self, forKey: .value)) ?? Self.makeDefault().value
        )
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
    }
}

// GetDateComponentStep

extension GetDateComponentStep: Copying {
    public func copy() -> GetDateComponentStep {
        return GetDateComponentStep(
                    component: component,
                    date: date
        )
    }
}

extension GetDateComponentStep {
     public enum Properties: String, ViewProperty {
        case component
        case date
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .component: return GetDateComponentStep.defaultValue(for: .component)
            case .date: return GetDateComponentStep.defaultValue(for: .date)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            component: factory(.component) as! CalendarComponentValue,
            date: factory(.date) as! TypedValue<DateValue>
        )
    }

    public static func makeDefault() -> Self {
        .init(
            component: Properties.component.defaultValue as! CalendarComponentValue,
            date: Properties.date.defaultValue as! TypedValue<DateValue>
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .component: return component
            case .date: return date
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .component: self.component = value as! CalendarComponentValue
            case .date: self.date = value as! TypedValue<DateValue>
        }
    }
}

extension VariableType {
    public static var getDateComponentStep: VariableType { .init(title: "GetDateComponentStep") } // GetDateComponentStep
}

extension GetDateComponentStep {
    enum CodingKeys: String, CodingKey {
        case component
        case date
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            component: (try? valueContainer.decode(CalendarComponentValue.self, forKey: .component)) ?? Properties.component.defaultValue as! CalendarComponentValue,
            date: (try? valueContainer.decode(TypedValue<DateValue>.self, forKey: .date)) ?? Properties.date.defaultValue as! TypedValue<DateValue>
        )
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(component, forKey: .component)
        try container.encode(date, forKey: .date)
    }
}



















public class Greg: AAProvider {
    public static var steps: [any StepType.Type] {
    [
        GetDateComponentStep.self
    ]
    }
    public static var values: [any EditableVariableValue.Type] {
    [
    DateValue.self,
    GetDateComponentStep.self,
    CalendarComponentValue.self
    ]
    }
    public static var views: [any MakeableView.Type] {
    [
    ]
    }
}

import Armstrong
import DylKit



