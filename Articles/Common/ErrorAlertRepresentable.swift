//
//  ErrorRepresentable.swift
//  Articles
//
//  Created by Kukreja, Chirag on 07/07/19.
//  Copyright © 2019 Kukreja, Chirag. All rights reserved.
//

import UIKit

protocol ErrorAlertRepresentable {
    var alertMessage:String { get }
}

extension ErrorAlertRepresentable {
    
    var basicAlertController:UIAlertController {
        let alertController = UIAlertController(title: nil, message: alertMessage, preferredStyle: .alert)
        alertController.addAction(genericOkayAction)
        return alertController
    }
    
    var genericOkayAction:UIAlertAction {
        return UIAlertAction(title: "O.K.", style: UIAlertAction.Style.default, handler: nil)
    }
    
}
