//
//  RegionServiceLegalityProtocol.swift
//
//
//  Created by Evan Anderson on 12/5/23.
//

import Foundation
import SwiftSovereignStates

public protocol RegionServiceLegalityProtocol {
    associatedtype CustomValues : RegionServiceLegalityProtocolCodingKeys
    
    var type : RegionServiceLegalityType { get }
    func description(for locale: Locale) -> String
    
    func status(for country: Country) -> RegionServiceLegalityStatus
    func customValue(for country: Country, key: CustomValues) -> (status: RegionServiceLegalityStatus, description: String)
    func yearOfData(for country: Country) -> Int
    func sources(for country: Country) -> [RegionServiceLegalitySource]
}

public protocol RegionServiceLegalityProtocolCodingKeys : CodingKey {
    var name : String { get }
    var valueType : Any.Type { get }
}

enum TestBro : RegionServiceLegalityProtocolCodingKeys {
    case yoink
    
    var name : String {
        switch self {
        case .yoink: return "Yoink!"
        }
    }
    
    var valueType : Any.Type {
        switch self {
        case .yoink: return String.self
        }
    }
}
