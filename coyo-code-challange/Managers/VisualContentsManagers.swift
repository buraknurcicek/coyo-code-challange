//
//  VisualContentsManagers.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 19.02.2022.
//

import UIKit

enum VisualContentsManager: GenericValueProtocol {

    typealias Value = UIImage

    case ic_coyo_logo

    var value: UIImage {
        switch self {
        case .ic_coyo_logo:
            return UIImage(named: "ic_coyo_logo")!
        }
    }
}
