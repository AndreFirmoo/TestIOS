//
//  AlertController.swift
//  Bank
//
//  Created by Andre Jardim Firmo on 23/06/20.
//  Copyright © 2020 Andre Jardim Firmo. All rights reserved.
//

import Foundation
import UIKit

class AlertView: NSObject {

    class func showAlert(view: UIViewController ,title:String , message: String) {
        let alert = UIAlertController(title: "Warning", message: message, preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        DispatchQueue.main.async {
            view.present(alert, animated: true, completion: nil)
        }
    }
}
