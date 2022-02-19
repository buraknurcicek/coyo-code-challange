//
//  AlertHelper.swift
//  coyo-code-challange
//
//  Created by Burak Nurçiçek on 19.02.2022.
//

import UIKit
import Foundation

protocol AlertFactoryService {
    var delegate: AlertActionDelegate? { get set }
    func build(alertData: AlertViewData) -> UIViewController
}

protocol AlertActionDelegate: AnyObject {
    func okAction()
}

class AlertHelper: AlertFactoryService {
    
    weak var delegate: AlertActionDelegate?
    
    func build(alertData: AlertViewData) -> UIViewController {
        let controller = UIAlertController(title: alertData.title,
                                           message: alertData.message,
                                           preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: alertData.okActionTitle,
                                     style: .cancel) { (_) in
                self.delegate?.okAction()
        }
        controller.addAction(okAction)
        return controller
    }
}

struct AlertViewData {
    let title: String
    let message: String
    let okActionTitle: String
    
    init(title: String,
         message: String,
         style: UIAlertController.Style = .alert,
         okActionTitle: String) {
        self.title = title
        self.message = message
        self.okActionTitle = okActionTitle
    }
}
