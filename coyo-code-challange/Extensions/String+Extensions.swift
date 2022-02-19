//
//  String+Extensions.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 19.02.2022.
//

import Foundation

extension String {
    func toLocalize() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
