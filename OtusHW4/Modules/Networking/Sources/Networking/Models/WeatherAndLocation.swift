//
// V1CurrentJsonGet200Response.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct WeatherAndLocation: Codable, JSONEncodable, Hashable {

    public var current: Weather?
    public var location: Location?

    public init(current: Weather? = nil, location: Location? = nil) {
        self.current = current
        self.location = location
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case current
        case location
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(current, forKey: .current)
        try container.encodeIfPresent(location, forKey: .location)
    }
}
