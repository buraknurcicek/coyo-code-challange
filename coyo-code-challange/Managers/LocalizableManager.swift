//
//  LocalizableManager.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 19.02.2022.
//

enum LocalizableManager: GenericValueProtocol {

    typealias Value = String

    case general_ok
    case general_error

    var value: String {
        switch self {
        case .general_ok:
            return "general_ok".toLocalize()
        case .general_error:
            return "general_error".toLocalize()
        }
    }
}
