//
//  RegionServiceLegalityType.swift
//
//
//  Created by Evan Anderson on 12/5/23.
//

import Foundation

public enum RegionServiceLegalityType : CaseIterable {
    case abortion
    case alcohol
    case bitcoin
    case cannabis
    case drug_ayahuasca
    case drug_cocaine
    case drug_ibogaine
    case drug_meth
    case drug_psilocybin_mushrooms
    case drug_psychoactive_cactus
    case drug_salvia_divinorum
    case guns
    case incest
    case marital_rape
    case pornography
    case prostitution
    case smoking
    
    public var value : (any RegionServiceLegalityProtocol)? {
        switch self {
        default: return nil
        }
    }
}
