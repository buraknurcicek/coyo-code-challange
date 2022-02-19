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
    func cancelAction()
}

class AlertImplementation: AlertFactoryService {

    weak var delegate: AlertActionDelegate?

    func build(alertData: AlertViewData) -> UIViewController {
        let controller = UIAlertController(title: alertData.title,
                                   message: alertData.message,
                                   preferredStyle: alertData.style)

        if alertData.enableOkAction {
            let okAction = UIAlertAction(
                           title: alertData.okActionTitle,
                           style: alertData.okActionStyle) { (_) in
                self.delegate?.okAction()
            }
            controller.addAction(okAction)
        }

        if alertData.enableCancelAction {
            let cancelAction = UIAlertAction(
                               title: alertData.cancelActionTitle,
                               style: alertData.cancelActionStyle) { (_) in
               self.delegate?.cancelAction()
            }
            controller.addAction(cancelAction)
        }
        return controller
    }
}

struct AlertViewData {
    let title: String
    let message: String
    let style: UIAlertController.Style
    let enableOkAction: Bool
    let okActionTitle: String
    let okActionStyle: UIAlertAction.Style
    let enableCancelAction: Bool
    let cancelActionTitle: String
    let cancelActionStyle: UIAlertAction.Style

    init(title: String,
         message: String,
         style: UIAlertController.Style = .alert,
         enableOkAction: Bool,
         okActionTitle: String,
         okActionStyle: UIAlertAction.Style,
         enableCancelAction: Bool = false,
         cancelActionTitle: String,
         cancelActionStyle: UIAlertAction.Style = .cancel) {
        self.title = title
        self.message = message
        self.style = style
        self.enableOkAction = enableOkAction
        self.okActionTitle = okActionTitle
        self.okActionStyle = okActionStyle
        self.enableCancelAction = enableCancelAction
        self.cancelActionTitle = cancelActionTitle
        self.cancelActionStyle = cancelActionStyle
    }
}
