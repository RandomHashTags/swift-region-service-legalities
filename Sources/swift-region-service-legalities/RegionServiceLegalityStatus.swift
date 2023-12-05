//
//  RegionServiceLegalityStatus.swift
//
//
//  Created by Evan Anderson on 12/5/23.
//

import Foundation

public enum RegionServiceLegalityStatus {
    case legal
    case legalConditionally
    case illegal
    case decriminalized
    
    case complicated
    case noRegulation
    case variesBySubdivision
    
    case unknown
}
