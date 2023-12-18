// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI
import DylKit














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
                    date: date
        )
    }
}

extension GetDateComponentStep {
     public enum Properties: String, ViewProperty {
        case date
        public var defaultValue: any EditableVariableValue {
            switch self {
            case .date: return GetDateComponentStep.defaultValue(for: .date)
            }
        }
    }
    public static func make(factory: (Properties) -> any EditableVariableValue) -> Self {
        .init(
            date: factory(.date) as! TypedValue<DateValue>
        )
    }

    public static func makeDefault() -> Self {
        .init(
            date: Properties.date.defaultValue as! TypedValue<DateValue>
        )
    }
    public func value(for property: Properties) -> any EditableVariableValue {
        switch property {
            case .date: return date
        }
    }

    public func set(_ value: Any, for property: Properties) {
        switch property {
            case .date: self.date = value as! TypedValue<DateValue>
        }
    }
}

extension VariableType {
    public static var getDateComponentStep: VariableType { .init(title: "GetDateComponentStep") } // GetDateComponentStep
}

extension GetDateComponentStep {
    enum CodingKeys: String, CodingKey {
        case date
    }

    public convenience init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            date: (try? valueContainer.decode(TypedValue<DateValue>.self, forKey: .date)) ?? Properties.date.defaultValue as! TypedValue<DateValue>
        )
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
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
    ]
    }
    public static var views: [any MakeableView.Type] {
    [
    ]
    }
}

import Armstrong
import DylKit



