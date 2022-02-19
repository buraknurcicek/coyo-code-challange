//
//  LocalizableManager.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 19.02.2022.
//

enum LocalizableManager: GenericValueProtocol {

    typealias Value = String

    case main_title
    case post_detail_title
    case general_ok
    case general_error_title
    case general_error_description

    var value: String {
        switch self {
        case .main_title:
            return "main_title".toLocalize()
        case .post_detail_title:
            return "post_detail_title".toLocalize()
        case .general_ok:
            return "general_ok".toLocalize()
        case .general_error_title:
            return "general_error_title".toLocalize()
        case .general_error_description:
            return "general_error_description".toLocalize()
        }
    }
}
