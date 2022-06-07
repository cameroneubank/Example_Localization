//
//  String+.swift
//  Localization
//
//  Created by Cameron Eubank on 6/7/22.
//

import Foundation
import UIKit

extension String {
    
    static func localized(_ key: String, comment: String = "", args: CVarArg...) -> String {
        let localized = NSLocalizedString(key,
                                          tableName: nil,
                                          bundle: .main, // Or the Bundle of the framework where the strings file resides.
                                          value: key,
                                          comment: comment)
        if args.isEmpty {
            return localized
        } else {
            return String(format: localized, args)
        }
    }
}
