//
// V1CurrentJsonGet200ResponseLocation.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct Location: Codable, JSONEncodable, Hashable {

    public var localtime: String?
    public var country: String?
    public var localtimeEpoch: Int?
    public var name: String?
    public var lon: Double?
    public var region: String?
    public var lat: Double?
    public var tzId: String?

    public init(localtime: String? = nil, country: String? = nil, localtimeEpoch: Int? = nil, name: String? = nil, lon: Double? = nil, region: String? = nil, lat: Double? = nil, tzId: String? = nil) {
        self.localtime = localtime
        self.country = country
        self.localtimeEpoch = localtimeEpoch
        self.name = name
        self.lon = lon
        self.region = region
        self.lat = lat
        self.tzId = tzId
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case localtime
        case country
        case localtimeEpoch = "localtime_epoch"
        case name
        case lon
        case region
        case lat
        case tzId = "tz_id"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(localtime, forKey: .localtime)
        try container.encodeIfPresent(country, forKey: .country)
        try container.encodeIfPresent(localtimeEpoch, forKey: .localtimeEpoch)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(lon, forKey: .lon)
        try container.encodeIfPresent(region, forKey: .region)
        try container.encodeIfPresent(lat, forKey: .lat)
        try container.encodeIfPresent(tzId, forKey: .tzId)
    }
}
