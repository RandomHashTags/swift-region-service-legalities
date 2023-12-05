//
//  Abortion.swift
//
//
//  Created by Evan Anderson on 12/5/23.
//

import Foundation
import SwiftSovereignStates

// https://en.wikipedia.org/wiki/Abortion_law
struct Abortion : RegionServiceLegalityProtocol {
    typealias CustomValues = Abortion.CustomValueCodingKeys
    
    var type : RegionServiceLegalityType {
        return RegionServiceLegalityType.abortion
    }
    
    func description(for locale: Locale) -> String {
        return "From Wikipedia:\nAbortion is the termination of a pregnancy by removal or expulsion of an embryo or fetus. An abortion that occurs without intervention is known as a miscarriage or \"spontaneous abortion\"; these occur in approximately 30% to 40% of all pregnancies. When deliberate steps are taken to end a pregnancy, it is called an induced abortion, or less frequently \"induced miscarriage\". The unmodified word abortion generally refers to an induced abortion. The most common reason women give for having an abortion is for birth-timing and limiting family size. Other reasons reported include maternal health, an inability to afford a child, domestic violence, lack of support, feeling they are too young, wishing to complete education or advance a career, and not being able or willing to raise a child conceived as a result of rape or incest."
    }
    
    func status(for country: Country) -> RegionServiceLegalityStatus {
        switch country {
        case .abkhazia,
                .el_salvador,
                .honduras,
                .nicaragua:
            return .illegal
        case .andorra,
                .dominican_republic,
                .madagascar,
                .philippines,
                .vatican_city,
                .northern_mariana_islands:
            return .complicated
        case .china:
            return .legal
        case .afghanistan,
                .albania,
                .algeria,
                .angola,
                .antigua_and_barbuda,
                .argentina,
                .armenia,
                .australia,
                .austria,
                .azerbaijan,
            
                .bahamas,
                .bahrain,
                .bangladesh,
                .barbados,
                .belarus,
                .belgium,
                .belize,
                .benin,
                .bhutan,
                .bolivia,
                .bosnia_and_herzegovina,
                .botswana,
                .brazil,
                .brunei,
                .bulgaria,
                .burkina_faso,
                .burundi,
            
                .cambodia,
                .cameroon,
                .canada,
                .cape_verde,
                .central_african_republic,
                .chad,
                .chile,
                .colombia,
                .comoros,
                .republic_of_the_congo,
                .costa_rica,
                .croatia,
                .cuba,
                .cyprus,
                .czech_republic,
                .democratic_republic_of_the_congo,
                .denmark,
                .djibouti,
                .dominica,
                
                .timor_leste,
                .ecuador,
                .egypt,
                .equatorial_guinea,
                .eritrea,
                .estonia,
                .eswatini,
                .ethiopia,
            
                .fiji,
                .finland,
                .france,
            
                .gabon
            :
            return .legalConditionally
        default:
            return .unknown
        }
    }
    
    func customValue(for country: Country, key: CustomValues) -> (status: RegionServiceLegalityStatus, description: String) {
        switch country {
        case .egypt: return egyptValue(key)
        default: return (.unknown, "Unknown value for country \(country) with custom key \(key)")
        }
    }
    
    func yearOfData(for country: Country) -> Int {
        switch country {
        default: return 2023
        }
    }
    
    func sources(for country: Country) -> [RegionServiceLegalitySource] {
        switch country {
        case .abkhazia: return abkhaziaSources()
        case .afghanistan: return afghanistanSources()
        case .egypt: return egyptSources()
        default: return []
        }
    }
}

extension Abortion {
    enum CustomValueCodingKeys : RegionServiceLegalityProtocolCodingKeys {
        case riskToLife
        case riskToHealth
        case rape
        case fetalImpairment
        case economicOrSocial
        case onRequest
        
        var name : String {
            return "\(self)"
        }
        
        var valueType : Any.Type {
            return String.self
        }
    }
}

// MARK: Abkhazia
extension Abortion {
    func abkhaziaSources() -> [RegionServiceLegalitySource] {
        return [
            RegionServiceLegalitySource("People's Assembly of Abkhazia: Article 40, Law of 29 January 2016", "http://presidentofabkhazia.org/upload/iblock/c55/14-Закон%20РА%20О%20здравоохранении.pdf")
        ]
    }
}

// MARK: Afghanistan
extension Abortion {
    func afghanistanSources() -> [RegionServiceLegalitySource] {
        return [
            RegionServiceLegalitySource("Wikipedia: Abortion in Afghanistan", "https://en.wikipedia.org/wiki/Abortion_in_Afghanistan")
        ]
    }
}

// MARK: Egypt
extension Abortion {
    func egyptSources() -> [RegionServiceLegalitySource] {
        return [
            RegionServiceLegalitySource("Parliament of Egypt: Articles 61 and 260-264", "https://manshurat.org/node/14677"),
            RegionServiceLegalitySource("Profession Ethics Regulation: Article 29", "https://web.archive.org/web/20211103044104/https://www.ems.org.eg/userfiles/file/kanon/leha_eng.doc"),
            RegionServiceLegalitySource("Wikipedia: Abortion in Egypt", "https://en.wikipedia.org/wiki/Abortion_in_Egypt")
        ]
    }
    func egyptValue(_ key: CustomValues) -> (status: RegionServiceLegalityStatus, description: String) {
        switch key {
        case .riskToLife,
                .riskToHealth:
            return (.legal, "permitted")
        default:
            return (.illegal, "prohibited")
        }
    }
}
