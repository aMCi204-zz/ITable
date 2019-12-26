//
//  UICustomAlert.swift
//  ITable
//
//  Created by Admin on 08.12.2019.
//  Copyright © 2019 amci. All rights reserved.
//

import Foundation
import UIKit

class UICustomAlert: NSObject {
    
    static func show(viewController: UIViewController,
                     title: String? = nil,
                     message: String? = nil)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        viewController.present(alert, animated: true, completion: nil)
    }
    
}
