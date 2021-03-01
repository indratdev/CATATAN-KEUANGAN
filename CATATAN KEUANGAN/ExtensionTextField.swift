//
//  ExtensionTextField.swift
//  CATATAN KEUANGAN
//
//  Created by IndratS on 01/03/21.
//  Copyright © 2021 IndratSaputra. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var currency: String {
        // removing all characters from string before formatting
        let stringWithoutSymbol = self.replacingOccurrences(of: "Rp", with: "")
        let stringWithoutComma = stringWithoutSymbol.replacingOccurrences(of: ",", with: "")
        
        let styler = NumberFormatter()
        styler.minimumFractionDigits = 0
        styler.maximumFractionDigits = 0
        styler.currencySymbol = "Rp"
        styler.numberStyle = .currency
        
        if let result = NumberFormatter().number(from: stringWithoutComma) {
            return styler.string(from: result)!
        }
        
        return self
    }
}


extension UIViewController {
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
