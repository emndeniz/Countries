//
//  StringUtilities.swift
//  Countries
//
//  Created by Emin on 11.12.2022.
//

import Foundation


struct StringUtilities {
    
    static func convertIntToFormattedString(intValue: Int?) -> String? {
        guard let intValue = intValue else { return nil }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: intValue))
    }
    
}
